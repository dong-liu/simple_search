class TicketsController < ApplicationController

  layout "main"

  def index
  	@tickets = Ticket.sorted
  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

end
