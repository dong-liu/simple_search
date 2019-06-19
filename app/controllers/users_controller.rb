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
  	else
	  	@user = User.find_by(params[:field] => params[:value])

  		if @user.nil?
  			# if we didn't find any result
  			flash[:notice] = "Search users for #{params[:field]} with a value of #{params[:value]} - no results found"
  		else			
	  		# get any related information if needed
  			@organization = Organization.find(@user.organization_id)
  			@tickets = Ticket.search_by_submitter_id(@user.id)		
  		end
  	end
  end

end
