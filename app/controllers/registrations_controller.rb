class RegistrationsController < Devise::RegistrationsController
  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
