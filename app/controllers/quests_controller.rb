class QuestsController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!

  def index
  end

  def display
    latitude = params[:lat].to_f
    longitude = params[:long].to_f

    @completed_quests = current_user.missions.finished
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

      if current_user.missions.collect(&:quest_id).include? quest.id
        marker.picture( { 
          url:    "http://gmapsmarkergenerator.eu01.aws.af.cm/getmarker?scale=1&color=00ff00",
          width:  22,
          height: 40
        })
      end
    end

    render partial: "tabs", layout: false
  end

private
  def infowindow(quest)
    "
      <h3> #{quest.title} </h3>
      <p> #{quest.description} </p>
      <hr/>
      <ul class='no-margin'>#{rewards(quest)}</ul>
      <hr/>
      <div class='text-center'>
        #{view_quest(quest)}
      </div>
    "
  end

  def rewards(quest)
    "".tap do |str|
      quest.rewards.each do |reward|
        str << "<li>#{reward.description}</li>"
      end
    end
  end

  def view_quest(quest)
    if current_user.missions.collect(&:quest_id).include? quest.id
      "
        <a href='javascript:void(0)' disabled class='btn btn-sm btn-warning'>
          You are currently doing this quest!
        </a>
      "
    else
      "
        <a href='#available' aria-controls='list' role='tab' data-toggle='tab' class='btn btn-sm btn-primary'>
          View Quest Now!
        </a>
      "
    end
  end

  def lat_lng_query(latitude, longitude)
    "lat BETWEEN #{latitude - 1} AND #{latitude + 1} AND long BETWEEN #{longitude - 1} AND #{longitude + 1}"
  end
end
