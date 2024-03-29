Authenticator::Application.routes.draw do
  root :to => 'home#index'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'sign_up' => 'users#new', as: 'sign_up'

  resources :users
  resources :sessions
end
