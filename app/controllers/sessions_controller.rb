class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.valid_password?(params[:session][:password])
      user.generate_token
      user.save
      @current_user = user
      render json: { data: user.to_hash, message: 'Signed in Successfully'}, status: :ok
    else
      render json: { errors: 'Email OR Password Invalid'}, status: :unprocessable_entity
    end
  end
end
