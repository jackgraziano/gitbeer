Rails.application.routes.draw do

  # Authentication
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/users/auth/linkedin', to: 'users/omniauth_callbacks#linkedin', as: 'oauth_linkedin_callback'

  # Facilities
  resources :facilities do
    collection do
      get 'search'
    end
  end

  # Attachinary
  mount Attachinary::Engine => "/attachinary"

  # Bookings
  resources :bookings

  # Messaging
  resources :conversations, only: [:index, :show]
  resources :messages, only: [:create]
end
