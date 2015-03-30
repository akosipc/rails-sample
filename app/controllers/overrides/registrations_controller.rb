class Overrides::RegistrationsController < Devise::RegistrationsController

protected
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    "/surveys/question_groups/#{Rapidfire::QuestionGroup.last.id}/answer_groups/new"
  end
end


