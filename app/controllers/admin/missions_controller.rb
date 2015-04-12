class Admin::MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @completed_missions = Mission.where(status: "Completed").order("created_at DESC").limit(5)
    @in_review_missions = Mission.where(status: "In Review").order("created_at DESC").limit(5)
    @accepted_missions = Mission.where(status: "Accepted").order("created_at DESC").limit(5)
  end

  def completed
    @missions = Mission.where(status: "Completed").order("created_at DESC").page(params[:page]).per(25)
  end

  def submitted
    @missions = Mission.where(status: "In Review").order("created_at DESC").page(params[:page]).per(25)
  end

  def accepted
    @missions = Mission.where(status: "Accepted").order("created_at DESC").page(params[:page]).per(25)
  end

end
