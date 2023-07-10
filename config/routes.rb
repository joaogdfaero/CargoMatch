Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :trips
  resources :users
  root to: 'pages#home'
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
end
