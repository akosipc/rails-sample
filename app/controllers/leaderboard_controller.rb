class LeaderboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order("score DESC")
  end
end
