class Admin::MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @completed_missions = Mission.where(status: "Completed")
    @in_review_missions = Mission.where(status: "In Review")
    @accepted_missions = Mission.where(status: "Accepted")
  end

end
