Rails.application.routes.draw do
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
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
