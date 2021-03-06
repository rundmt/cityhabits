class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :bio, :avatar, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :bio, :avatar, :email, :password, :password_confirmation)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    home_index_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_index_path
  end
end
