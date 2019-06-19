class UsersController < ApplicationController

  layout "main"

  def index
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  	@organization_id = @user.organization_id
  end

  def search
  	if params[:field].nil?
  		flash.now[:notice] = "Not a valid field"
  	else
  		@user = User.find_by(params[:field] => params[:value]);
  		if @user.nil?
  			flash[:notice] = "Search users for #{params[:field]} with a value of #{params[:value]} - no results found"
  		else
	  		@organization = Organization.find(@user.organization_id)
	  		#@tickets = Ticket.where(:submitter_id => @user._id)
	  		@tickets = Ticket.search_by_submitter_id(@user.id)
	  	end
  	end
  end

end
