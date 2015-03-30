class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end

  def can_administer?
    current_user.admin?
  end

private
  def authenticate_admin!
    raise CanCan::AccessDenied.new("You are not authorized to view this") unless current_user.admin?
  end

end
