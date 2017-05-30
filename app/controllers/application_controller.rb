class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :user_name,
                                                       :date_of_birth,
                                                       :picture])
                                                       :date_of_birth])
    devise_parameter_sanitizer(:account_update, keys: [:first_name,
                                                       :last_name,
                                                       :user_name,
                                                       :date_of_birth,
                                                       :current_password,
                                                       :password,
                                                       :password_confirmation])
  end
end
