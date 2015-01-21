class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9_-]+\z/ }


  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    username
  end
end
