class QuestsController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!

  def index
    @accepted_quests = current_user.missions.current
    if current_user.mission_ids.present?
      @available_quests = Quest.where("level <= (?) AND id NOT IN (?)", current_user.level, current_user.mission_ids)
    else
      @available_quests = Quest.where("level <= ?", current_user.level)
    end

    @quests = Gmaps4rails.build_markers(@available_quests) do |quest, marker|
      marker.lat quest.lat
      marker.lng quest.long
      marker.infowindow infowindow(quest)
    end
  end

private
  def infowindow(quest)
    "
      <h3> #{quest.title} </h3>
      <p> #{quest.description} </p>
    "
  end
end
