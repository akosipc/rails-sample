class MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quest

  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to quests_path, notice: "Quest Accepted!"
    else
      redirect_to quests_path, alert: "You currently have 4 quests. You must finish the current quests you have."
    end
  end

  def show
    @mission = Mission.find(params[:id])

    render partial: "details", layout: false if request.xhr?
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])

    if @mission.update_attributes(mission_images.merge(status: "In Review"))
      redirect_to quests_path, notice: "Quest #{params[:status]}!"
    else
      redirect_to quests_path, alert: "An error was encountered. Please contact our Support team."
    end
  end

private

  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def mission_params
    {
      quest_id:   @quest.id,
      user_id:    current_user.id      
    }
  end

  def mission_images
    params.require(:mission).permit(:filepicker_url)
  end

end
