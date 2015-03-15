class User < ActiveRecord::Base
  include Amistad::FriendModel

  acts_as_liker
  acts_as_messageable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9_-]+\z/ }

  has_many :posts
  has_many :comments
  has_many :missions

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

end
