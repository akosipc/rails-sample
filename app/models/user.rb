class User < ActiveRecord::Base
  include Amistad::FriendModel

  acts_as_voter
  acts_as_messageable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9_-]+\z/ }

  has_many :posts
  has_many :comments

  def full_name
    "#{first_name} #{last_name}"
  end

end
