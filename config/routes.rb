Rails.application.routes.draw do
  get 'home', to: 'home#index'
  resources :books
  resources :authors do
    resources :books, only: [:index, :show]
  end
  resources :users, only: [:index, :create, :edit, :show, :update]
  resources :sessions, only: [:create]
  resources :loans
  resources :categories, only: [:index, :show]

  scope 'librarians', module: 'librarians' do
    resources :dashboard, only: [:index]
  end

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback' => 'sessions#create'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
