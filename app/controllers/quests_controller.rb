class QuestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @quests = Gmaps4rails.build_markers(Quest.all) do |quest, marker|
      marker.lat quest.lat
      marker.lng quest.long
      marker.infowindow infowindow(quest)
    end
  end

  def update
    @quest = Quest.find(params[:id])

    if @quest.accept!(current_user)
      redirect_to quests_path, notice: "Quest Accepted!"
    else
      redirect_to quests_path, notice: "Quest Denied!"
    end
  end

  private
    def infowindow(quest)
      "
        <p> #{quest.title} </p>
        <p> #{quest.description} </p>
        <a href='quests/#{quest.id}' data-method='put' class='btn btn-primary btn-xs'>
          Accept
        </a>
      "
    end
end
