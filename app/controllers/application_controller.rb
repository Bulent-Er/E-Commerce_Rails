class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :password, :password_confirmation])
  end
end