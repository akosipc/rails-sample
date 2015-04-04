class Achievement < ActiveRecord::Base

  belongs_to :badge
  belongs_to :user

  validates :badge_id, uniqueness: { scope: :user_id }

end
