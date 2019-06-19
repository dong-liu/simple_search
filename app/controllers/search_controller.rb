class SearchController < ApplicationController

  def index
  end

  def show
  	if params[:search_menu].nil?
  		flash.now[:notice] = "Please choose from one of the options."
  	else
      @choice = params[:search_menu][:choice]
      case @choice.downcase
      when "1"
      	@search_from_model = ["Users", "Tickets", "Organizations"]
      when "2"
      	redirect_to(view_list_path)
      when "3"
      when "quit"
      	redirect_to(search_exit_path)
      else
      	flash.now[:notice] = "The option is not valid, please try again."
      end
    end
  end

	def view_list
  end

  def perform_search
  	if params[:search].nil?
  		flash.now[:notice] = "Please choose one of the models to search from."
  	else
    	@model = params[:search][:model]
    	@field = params[:search][:field]
    	@value = params[:search][:value]
    	case @model
    	when "1"			#User
    		redirect_to(search_user_path(@user, :field => @field, :value => @value))
    	when "2"			#Tickets
    		redirect_to(search_ticket_path(@ticket, :field => @field, :value => @value))
    	when "3"			#Organization
    		redirect_to(search_organization_path(@organization, :field => @field, :value => @value))
    	else
    		flash.now[:notice] = "The option is not valid, please try again."
    	end
  	end
  end

  def exit
  end
end
