class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def auth_user!(opts = {})
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :first_name, :last_name, :birthday, :avatar, :passport]
    devise_parameter_sanitizer.for(:account_update) << [:name, :first_name, :last_name, :birthday, :avatar, :passport]
  end
end
