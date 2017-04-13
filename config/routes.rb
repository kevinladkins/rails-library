Rails.application.routes.draw do
  resources :users, path_names: {new: 'signup'}
  resources :sessions, only: [:new, :create, :destroy], path_names: {new: 'login', destroy: 'logout'}
  get 'auth/:provider/callback' => 'sessions#create'
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
