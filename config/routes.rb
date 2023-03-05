Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions     : 'users/sessions',
    omniauth_callbacks: 'omniauth_callbacks'
  }
end
