module ApplicationHelper

  def owner?
    current_user == @user
  end

  def owner_of?(object)
    current_user == object.user
  end

end
