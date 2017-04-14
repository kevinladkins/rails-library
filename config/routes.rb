Rails.application.routes.draw do
  resources :books
  resources :authors do
    resources :books, only: [:index, :show]
  end
  resources :users, only: [:index, :create, :edit, :update, :delete]
  resources :sessions, only: :create
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback' => 'sessions#create'

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
