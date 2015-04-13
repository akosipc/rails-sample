class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchaseable_rewards = Reward.purchaseable_by_gold
    @rewards = current_user.bounties.others.page(params[:page]).per(75)
  end

  def update
    @reward = Reward.find(params[:id])

    if @reward.purchase!(current_user)
      redirect_to rewards_path, notice: "Purchase has been completed. An admin will send you the reward shortly."
    else
      redirect_to rewards_path, alert: "You have insufficent funds."
    end
  end
end
