Rails.application.routes.draw do
  resources :transactions
  resources :items
  resources :teams, shallow: true do
    resources :months
  end
  resources :months, shallow: true, only: [] do
    resources :categories, except: [ :index ]
  end
  resources :categories, shallow: true, only: [] do
    resources :items, except: [ :index, :show ]
  end
  resources :items, shallow: true, only: [] do
    resources :transactions, except: [ :index, :show ]
  end

  resources :transactions, only: [ :new, :create ]

  devise_for :users

  get "users/:id", to: redirect('/teams/new'), as: :user

  get 'home/index'
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
