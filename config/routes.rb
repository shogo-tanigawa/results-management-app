Rails.application.routes.draw do
  root 'static_pages#top'
  get '/display_pdf/:id', to: 'games#display_pdf', as: :'game_display_pdf'

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  resources :users, :only => [:index, :show, :destroy]
  resources :games do
    member do
      get :display_pdf
    end
  end

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
end
