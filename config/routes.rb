Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/search', to: 'trips#search'
  resources :reviews, only: %i[index destroy]
  resources :bookings, only: [:index]
  resources :bookmarks, only: %i[index destroy]
  resources :users, only: [:show]
  resources :trips do
    resources :reviews, only: %i[new create]
    resources :bookmarks, only: %i[create]
    resources :bookings, only: %i[create destroy] do
      member do
        post :accept
        post :reject
      end
    end
  end

  # === CHATROOM === #

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
