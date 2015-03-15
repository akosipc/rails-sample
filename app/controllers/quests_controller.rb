class QuestsController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!

  def index
    @accepted_quests = current_user.missions
    @available_quests = Quest.where("(level = ? or level <= ?) and id not in (?)", nil, current_user.level, current_user.mission_ids)

    @quests = Gmaps4rails.build_markers(Quest.all) do |quest, marker|
      marker.lat quest.lat
      marker.lng quest.long
      marker.infowindow infowindow(quest)
    end
  end

private
  def infowindow(quest)
    "
      <p> #{quest.title} </p>
      <p> #{quest.description} </p>
    "
  end
end
