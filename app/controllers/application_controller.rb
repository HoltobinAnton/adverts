class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :email, :password, :birthday, :full_name, :role_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login, :email, :password, :current_password, :birthday, :full_name, :role_id])
  end
end
