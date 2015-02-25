class Quest < ActiveRecord::Base

  geocoded_by :address do |object, results|
    if geo = results.first
      object.lat = geo.latitude
      object.long = geo.longitude
    end
  end
  after_validation :geocode, if: lambda { |obj| obj.address_changed? }

  validates :address, :title, :description, presence: true

  has_many :rewards

  def accept!(user)
    score = rewards.sum(:amount)
    user.update_attributes(score: user.score + score)
  end
end
