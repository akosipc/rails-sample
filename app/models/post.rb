class Post < ActiveRecord::Base
  acts_as_votable

  validates :content, presence: true

  has_many :comments
  belongs_to :user

end
