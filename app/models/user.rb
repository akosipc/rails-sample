class User < ActiveRecord::Base
  include Amistad::FriendModel

  acts_as_liker
  acts_as_messageable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9_-]+\z/ }

  has_many :posts
  has_many :comments
  has_many :missions
  has_many :bounties

  mount_uploader :avatar, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  def sanitized_friends
    self.friends.map do |friend|
      [friend.full_name, friend.id]
    end
  end

  def mission_ids
    missions.collect(&:quest_id)
  end

  def rewards
    quest_ids = missions.where(status: "Completed").select(:quest_id)
    Quest.where(id: quest_ids).collect(&:rewards).flatten
  end

  def total_gold
    bounties.gold.collect(&:amount_in_numbers).sum
  end

end
