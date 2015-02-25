class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
    @activities = PublicActivity::Activity.where(recipient: current_user).order("created_at DESC")
  end
end
