Rails.application.routes.draw do

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'home', to: 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :books do
    get :most_borrowed, on: :collection
    resources :categories, only: [:new, :create, :edit, :update]
   end

  resources :authors do
    resources :books, only: [:index, :show, :new, :create]
  end

  resources :categories, only: [:index, :show]
  get 'categories/:id/next', to: 'categories#next'
  resources :users, only: [:index, :create, :edit, :show, :update, :destroy]
  resources :sessions, only: [:create]
  resources :loans, only: [:index, :create, :edit, :update]

  scope 'librarians', module: 'librarians' do
    resources :dashboard, only: [:index]
    get 'dashboard/stats', to: 'dashboard#stats'
  end


  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
