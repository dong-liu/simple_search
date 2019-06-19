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
  	else
  		@ticket = Ticket.find_by(params[:field] => params[:value]);
  		if @ticket.nil?
  			flash[:notice] = "Search tickets for #{params[:field]} with a value of #{params[:value]} - no results found"
  		else
  			@organization = Organization.find(@ticket.organization_id)
  			@submitter = User.find(@ticket.submitter_id)
  			@assignee = User.find(@ticket.assignee_id)
  		end
  	end
  end
  


end
