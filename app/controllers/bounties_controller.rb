class BountiesController < ApplicationController
  before_action :authenticate_user!

  def update
    @bounty = Bounty.find(params[:id])

    if @bounty.request!
      redirect_to rewards_path, notice: "Request has been sent! An admin will send you the reward shortly"
    else
      redirect_to rewards_path, notice: "An error was encountered. Please contact our support team to solve this issue."
    end
  end

end
