class Bounty < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest

  scope :gold, -> { where(category: "Gold") }

  def complete!
    update_attributes(status: "Completed")
  end

  def amount_in_numbers
    amount.to_i
  end
end
