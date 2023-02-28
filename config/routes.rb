Rails.application.routes.draw do
  get 'static_pages/top'
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
end
