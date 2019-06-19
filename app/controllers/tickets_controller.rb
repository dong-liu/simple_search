class TicketsController < ApplicationController

  layout "main"

  def index
  	@tickets = Ticket.sorted
  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

  def search
  	if params[:field].nil?
  		flash.now[:notice] = "Not a valid field"
  	elsif column_exist?(params[:field])
  		# only proceed when params[:field] is a valid column for the Ticket model
  		@ticket = Ticket.find_by(params[:field] => params[:value]);
  		if @ticket.nil?
  			flash[:notice] = "Search ticket for #{params[:field]} with a value of #{params[:value]} - no results found"
  		else
  			@organization = Organization.find(@ticket.organization_id)
  			@submitter = User.find(@ticket.submitter_id)
  			@assignee = User.find(@ticket.assignee_id)
  		end
  	else
  		flash[:notice] = "#{params[:field]} is not a valid db column for Ticket"
  	end
  end
  
  private
  def column_exist?(column)
  	@all_db_fields = ["_id", "url", "external_id", "created_at", "type", "subject", "description", "priority", "status", "submitter_id", "assignee_id", "organization_id", "tags", "has_incidents", "due_at", "via"]
  	return @all_db_fields.include?(column)
  end

end
