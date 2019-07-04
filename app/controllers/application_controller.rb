class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user, unless: :devise_controller?

  respond_to :json

  private

  def authenticate_user
    if request.headers['Authorization'].present?
      user = User.find_by(auth_token: request.headers['Authorization'])
      if user.present?
        @current_user = user
        return true
      end
    else
      render json: {error: 'Please Sign in First'}, status: :unauthorized
    end
  end

  def authenticate_user!
    head :unauthorized unless signed_in?
  end

  def signed_in?
    current_user.present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :email])
  end
end
