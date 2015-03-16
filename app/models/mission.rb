class Mission < ActiveRecord::Base

  belongs_to :quest
  belongs_to :user
  has_many :rewards, through: :quest

  before_create :check_current_missions

  def self.current
    where("status IN (?)", ["Accepted", "In Review"])
  end

  def accept!
    self.update_attributes(status: "Completed")
    RewardMailer.notify(self).deliver!
  end

private

  def check_current_missions
    false if self.user.missions.current.count == 4
  end

end
