class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:fullname, :email)
  end

  def account_update_params
    params.require(:user).permit(:fullname, :email)
  end
end
