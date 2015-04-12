class Reward < ActiveRecord::Base
  has_and_belongs_to_many :quests

  validates :name, :description, :amount, :category, presence: true
  
  scope :experience, -> { where(category: "Experience" ) }
  scope :gold, -> { where(category: "Gold" ) }
  scope :others, -> { where(category: "Others" ) }

  def experience?
    category == "Experience"
  end
  
  def gold?
    category == "Gold"
  end

  rails_admin do
    field :name
    field :description
    field :amount
    field :category, :enum do
      enum do
        ["Experience", "Gold", "Others"]
      end
    end
    field :quests
  end
end
