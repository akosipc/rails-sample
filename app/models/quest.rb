class Quest < ActiveRecord::Base

  geocoded_by :address do |object, results|
    if geo = results.first
      object.lat = geo.latitude
      object.long = geo.longitude
    end
  end
  after_validation :geocode, if: lambda { |obj| obj.address_changed? }

  validates :address, :title, :description, presence: true
  validates :level, numericality: { greater_than: 0 }

  has_and_belongs_to_many :rewards
  has_many :missions
  has_many :bounties

  def accept!(user)
    score = rewards.sum(:amount)
    user.update_attributes(score: user.score + score)
  end

  def display_rewards
    rewards.any? ? rewards.collect(&:description).to_sentence : "n/a"
  end

  def gold
    rewards.gold.any? ? rewards.gold.collect(&:description).to_sentence : "n/a"
  end

  def experience
    rewards.experience.any? ? rewards.experience.collect(&:description).to_sentence : "n/a"
  end

  def others
    rewards.others.any? ? rewards.others.collect(&:description).to_sentence : "n/a"
  end
end
