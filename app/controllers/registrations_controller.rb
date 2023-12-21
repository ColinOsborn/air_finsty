class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    user_params
  end

  def account_update_params
    user_params
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation, :current_password)
  end
end
