class Badge < ActiveRecord::Base

  has_many :achievements

  validates :name, :description, presence: true
  validates :based_on, uniqueness: { scope: :based_at }

end
