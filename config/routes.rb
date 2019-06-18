Rails.application.routes.draw do

  #get 'organization/index'
  #get 'organization/show'
 
  resources :organizations do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end

  resources :tickets do
    member do
      get :delete
    end
  end

	# default route
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
