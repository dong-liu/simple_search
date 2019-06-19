Rails.application.routes.draw do

  get 'search', :to => 'search#index'
  get 'search/show', :to => 'search#show'
  get 'search/perform_search', :to => 'search#perform_search', :as => 'perform_search'
  get 'search/view_list', :to => 'search#view_list', :as => 'view_list'
  get 'search/exit', :to => 'search#exit'

  get 'users/search/:field/:value', to: 'users#search', :as => 'search_user'
  get 'organizations/search/:field/:value', to: 'organizations#search', :as => 'search_organization'
  get 'tickets/search/:field/:value', to: 'tickets#search', :as => 'search_ticket'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
