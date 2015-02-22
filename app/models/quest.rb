class Quest < ActiveRecord::Base

  geocoded_by :address do |object, results|
    if geo = results.first
      object.lat = geo.latitude
      object.long = geo.longitude
    end
  end
  after_validation :geocode, if: lambda { |obj| obj.address_changed? }

  validates :address, :title, :description, presence: true

end
