Rails.application.routes.draw do
  devise_for :users,
        controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :facilities do
    collection do
      get 'search'
    end
  end
  resources :bookings
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
