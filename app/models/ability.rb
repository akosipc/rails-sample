class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all

    unless user.admin?
      cannot :access, :rails_admin
      cannot :dashboard
    end

  end
end
