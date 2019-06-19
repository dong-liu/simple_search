class OrganizationsController < ApplicationController

  layout "main"

  def index
  	@organizations = Organization.sorted
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def search
  	if params[:field].nil?
  		flash.now[:notice] = "Not a valid field"
  	else
  		@organization = Organization.find_by(params[:field] => params[:value]);
  	end
  end
end
