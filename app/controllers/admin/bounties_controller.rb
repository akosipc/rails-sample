class Admin::BountiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @bounties = Bounty.others.where(status: "Requested")
  end

  def update
    @bounty = Bounty.find(params[:id])
    
    if @bounty.complete!
      redirect_to admin_bounties_path, notice: "Reward sent!"
    else
      redirect_to admin_bounties_path, error: "Something went wrong. Please contact our support team."
    end
  end
end
