Rails.application.routes.draw do
  resources :trips
  resources :users
  root to: 'pages#home'
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
end
