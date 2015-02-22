class Overrides::RegistrationsController < Devise::RegistrationsController
  protected
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end

