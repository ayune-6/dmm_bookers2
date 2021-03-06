class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end

  # def configure_sign_in_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  # end

end
