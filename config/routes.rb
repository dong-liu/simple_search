Rails.application.routes.draw do

  #get 'organization/index'
  #get 'organization/show'
 
  resources :organization do
    member do
      get :delete
    end
  end

	# default route
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
