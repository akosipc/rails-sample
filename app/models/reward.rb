class Reward < ActiveRecord::Base
  has_and_belongs_to_many :quests

  validates :name, :description, :amount, :category, presence: true
  
  scope :experience, -> { where(category: "Experience" ) }
  scope :gold, -> { where(category: "Gold" ) }
  scope :others, -> { where(category: "Others" ) }
  scope :purchaseable_by_gold, -> { where(purchaseable: true) }

  def experience?
    category == "Experience"
  end
  
  def gold?
    category == "Gold"
  end

  def purchase!(user)
    if user.total_gold >= self.purchaseable_for
      Bounty.create(
        name:       self.name,
        amount:     self.amount,
        category:   self.category,
        status:     "Requested",
        user_id:    user.id)

      user.update_attributes(gold_spent: user.gold_spent + self.purchaseable_for)
    end
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
    field :purchaseable
    field :purchaseable_for
  end
end
