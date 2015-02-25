class Reward < ActiveRecord::Base
  belongs_to :quest

  validates :name, :description, :amount, presence: true
end
