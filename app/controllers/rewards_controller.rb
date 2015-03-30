class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = current_user.bounties.page(params[:page]).per(75)
  end
end
