class QuestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @quests = Gmaps4rails.build_markers(Quest.all) do |quest, marker|
      marker.lat quest.lat
      marker.lng quest.long
    end
  end
end
