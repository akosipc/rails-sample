class Overrides::RegistrationsController < Devise::RegistrationsController

protected
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    new_question_group_answer_groups_path(Rapidfire::Question.first)
  end
end


