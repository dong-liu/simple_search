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
  	elsif column_exist?(params[:field])
  		# only proceed when params[:field] is a valid column for the Organization model
  		@organization = Organization.find_by(params[:field] => params[:value])
  		if @organization.nil?
  			# if we didn't find any result
  			flash[:notice] = "Search organizations for #{params[:field]} with a value of #{params[:value]} - no results found"
  		end
  	else
  		flash[:notice] = "#{params[:field]} is not a valid db column for Organization"
  	end
  end

  private
  def column_exist?(column)
  	@all_db_fields = ["_id", "url", "external_id", "name", "domain_name", "created_at", "details", "shared_tickets", "tags"]
  	return @all_db_fields.include?(column)
  end

end
