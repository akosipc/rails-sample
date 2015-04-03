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

    if @mission.update_attributes(mission_images.merge(status: "In Review", submitted_at: DateTime.now))
      redirect_to quests_path, notice: "Quest is submitted for review!"
    else
      redirect_to quests_path, alert: "An error was encountered. Please contact our Support team."
    end
  end

  def accept
    @mission = Mission.find(params[:id])

    if @mission.accept!
      redirect_to admin_missions_path, notice: "Quest is approved!"
    else
      redirect_to admin_missions_path, alert: "An error was encountered. Please contact our Support team."
    end
  end

  def cancel
    @mission = Mission.find(params[:id])

    if @mission.cancel!
      redirect_to quests_path, notice: "Quest is now cancelled"
    else
      redirect_to quests_path, alert: "An error was encountered. Please contact our Support team."
    end
  end

  def reject
    @mission = Mission.find(params[:id])

    if @mission.reject!
      redirect_to admin_missions_path, notice: "Quest was rejected."
    else
      redirect_to admin_missions_path, alert: "An error was encountered. Please contact our Support team."
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
