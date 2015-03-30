class Bounty < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest

  def complete!
    update_attributes(status: "Completed")
  end
end
