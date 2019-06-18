class OrganizationController < ApplicationController

  layout "main"

  def index
  	@organizations = Organization.sorted
  end

  def show
  	@organization = Organization.find(params[:id])
  end

end
