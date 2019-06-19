class SearchController < ApplicationController

  def index
  end

  def show
  	if params[:search_menu].nil?
  		# for whatever the reason, we didn't catch user's input from the previous menu
  		flash[:notice] = "The last choice is not valid. Please try again."
  		redirect_to(search_path)
  	else
      @choice = params[:search_menu][:choice]
      case @choice.downcase
      when "1"
      	@search_from_model = ["Users", "Tickets", "Organizations"]
      when "2"
      	redirect_to(view_list_path)
      when "quit"
      	redirect_to(search_exit_path)
      else
      	flash[:notice] = "The choice is not valid. Please try again."
      	redirect_to(search_path)
      end
    end
  end

	def view_list
  end

  def perform_search
  	if params[:search].nil?
  		flash.now[:notice] = "The last choice is not valid. Please try again."
  		redirect_to(search_path)
  	else
    	@model = params[:search][:model]
    	@field = params[:search][:field]
    	@value = params[:search][:value]
    	case @model
    	when "1"			#User
    		redirect_to(search_user_path(:field => @field, :value => @value))
    	when "2"			#Tickets
    		redirect_to(search_ticket_path(:field => @field, :value => @value))
    	when "3"			#Organization
    		redirect_to(search_organization_path(:field => @field, :value => @value))
    	else
    		flash[:notice] = "The option is not valid, please try again."
    		redirect_to(search_show_path)
    	end
  	end
  end

  def exit
  end
end
