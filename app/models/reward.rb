class Reward < ActiveRecord::Base
  has_and_belongs_to_many :quests

  validates :name, :description, :amount, presence: true
end
