class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def current_user
    super
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
