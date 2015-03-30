module ApplicationHelper

  def owner?
    current_user == @user
  end

  def owner_of?(object)
    current_user == object.user
  end

  def active?(*args)
    if args.count == 1
      "active" if params[:action] == args[0].to_s
    else
      "active" if params[:controller].include?(args[0].to_s) && params[:action] == args[1].to_s
    end
  end

end
