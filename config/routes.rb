Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :trips do
    get 'join', on: :member

    member do
      patch 'accept_request'
      delete 'reject_request'
      get 'manage_requests'
    end
  end

  delete 'trips/:id', to: 'trips#destroy'
  get 'my_trips', to: 'trips#my_trips'
  
  resources :users
  root to: 'pages#home'
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
end
