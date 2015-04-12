class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
    @activities = PublicActivity::Activity.where(recipient: current_user).where.not(key: "comment.create").order("created_at DESC")
  end

  def privacy

  end

  def about

  end

  def contact

  end

end
