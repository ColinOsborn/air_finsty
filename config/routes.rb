Rails.application.routes.draw do
  # devise_for :users, controllers: { registrations: 'registrations' }

  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  root 'pages#home'
  get 'pages/home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
