module ApplicationHelper

  def owner?
    current_user == @user
  end

end
