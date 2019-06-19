class UsersController < ApplicationController

  layout "main"

  def index
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  end

  def search
  	if params[:field].nil?
  		flash.now[:notice] = "Not a valid field"
  	elsif column_exist?(params[:field])
  		# only proceed when params[:field] is a valid column for the User model
	  	@user = User.find_by(params[:field] => params[:value])
  		if @user.nil?
  			# if we didn't find any result
  			flash[:notice] = "Search user for #{params[:field]} with a value of #{params[:value]} - no results found"
  		else			
	  		# get any related information when needed
  			@organization = Organization.find(@user.organization_id)
  			@tickets = Ticket.search_by_submitter_id(@user.id)		
  		end
  	else
  		flash[:notice] = "#{params[:field]} is not a valid db column for User"
  	end
  end

  private
  def column_exist?(column)
  	@all_db_fields = ["_id", "url", "external_id", "name", "alias", "created_at", "active", "verified", "shared", "locale", "timezone", "last_login_at", "email", "phone", "signature", "organization_id", "tags", "suspended", "role"]
  	return @all_db_fields.include?(column)
  end
end
