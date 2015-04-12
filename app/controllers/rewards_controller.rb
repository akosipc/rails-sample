class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = current_user.bounties.others.page(params[:page]).per(75)
  end
end
