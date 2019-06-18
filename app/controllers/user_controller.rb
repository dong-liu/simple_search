class UserController < ApplicationController

  layout "main"

  def index
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  	@organization_id = "TBD"
  end

end
