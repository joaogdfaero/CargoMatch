Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :trips do
    get 'join', on: :member
  end
  resources :users
  root to: 'pages#home'
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
end
