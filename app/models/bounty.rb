class Bounty < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest

  scope :gold, -> { where(category: "Gold") }
  scope :experience, -> { where(category: "Experience") }
  scope :others, -> { where(category: "Others") }

  def complete!
    update_attributes(status: "Completed")
  end

  def request!
    update_attributes(status: "Requested")
  end

  def amount_in_numbers
    amount.to_i
  end
end
