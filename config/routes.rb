Rails.application.routes.draw do
  resources :trips
  resources :users
  root to: 'pages#home'
end
