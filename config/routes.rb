Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }

  # devise_for :users,
  #   path: '',
  #   path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  #   controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
  resources :rentals, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  end
end
