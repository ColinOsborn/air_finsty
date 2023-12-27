class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    user_params
  end

  def update_resource(resource, params)
    resource.update_without_password(user_params)
  end

  def user_params
    params.require(:user).permit(:fullname,
                                 :email,
                                 :password,
                                 :phone_number,
                                 :description,
                                 :password_confirmation,
                                 :current_password)
  end
end
