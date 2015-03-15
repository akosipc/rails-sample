class Mission < ActiveRecord::Base

  belongs_to :quest
  belongs_to :user

  before_create :check_current_missions

  def self.current
    where("status IN (?)", ["Accepted", "In Review"])
  end

private

  def check_current_missions
    false if self.user.missions.current.count == 4
  end

end
