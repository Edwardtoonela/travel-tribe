Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/search', to: 'trips#search'

  resources :users, only: [:show]
  resources :trips do
    resources :bookings, only: %i[create destroy]
    resources :reviews, only: %i[new create destroy]
    resources :bookmarks, only: %i[new create destroy]
  end

  # === CHATROOM === #
  
  resources :chatrooms, only: :show
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
