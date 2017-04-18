Rails.application.routes.draw do
  devise_for :users,
        controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :facilities
  resources :bookings
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/auth/linkedin', to: 'users/omniauth_callbacks#linkedin', as: 'oauth_linkedin_callback'


end
