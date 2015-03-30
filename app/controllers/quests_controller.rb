class QuestsController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!

  def index
  end

  def display
    latitude = params[:lat].to_f
    longitude = params[:long].to_f

    @accepted_quests = current_user.missions.current
    if current_user.mission_ids.present?
      @available_quests = Quest.where("level <= (?) AND id NOT IN (?) AND #{lat_lng_query(latitude, longitude)}", current_user.level, current_user.mission_ids)
    else
      @available_quests = Quest.where("level <= ? AND #{lat_lng_query(latitude, longitude)}", current_user.level)
    end

    @quests = Gmaps4rails.build_markers(@available_quests) do |quest, marker|
      marker.lat quest.lat
      marker.lng quest.long
      marker.infowindow infowindow(quest)
    end

    render partial: "tabs", layout: false
  end

private
  def infowindow(quest)
    "
      <h3> #{quest.title} </h3>
      <p> #{quest.description} </p>
    "
  end

  def lat_lng_query(latitude, longitude)
    "lat BETWEEN #{latitude - 1} AND #{latitude + 1} AND long BETWEEN #{longitude - 1} AND #{longitude + 1}"
  end
end
