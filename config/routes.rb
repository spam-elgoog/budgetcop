# frozen_string_literal: true

Rails.application.routes.draw do
  # for setting up a default page
  root 'welcome#index'
  # or rails < 4
  # root to: 'welcome#index'
  # get 'welcome/index'
  get '/plan/:budget_plan_id/expenses(.:format)', to: 'expenses#index', as: 'my_expenses'
  get '/plans(.:format)', to: 'budget_plans#index'

  #
  # Users
  #
  resources :users do
    resources :budget_plans do
      resources :expenses
    end
  end
  #
  # Session and Authentication routes
  # Remapping route
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'

  #
  # Categories
  #
  get '/categories', to: 'categories#index'
  # get '/json/categories', to: 'categories#catjson'
end
