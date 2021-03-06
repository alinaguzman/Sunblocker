class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    registration_params = [:email, :password, :password_confirmation, :zipcode, :first_name, :last_name]
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) do
      |u| u.permit(registration_params)
      end
    end
  end
end
