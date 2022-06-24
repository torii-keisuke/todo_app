class Users::SessionsController < Devise::SessionsController

  private

  def sign_in_params
    params.permit(:email, :password)
  end
end
