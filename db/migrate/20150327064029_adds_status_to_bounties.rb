class AddsStatusToBounties < ActiveRecord::Migration
  def change
    add_column :bounties, :status, :string, default: "Pending"
  end
end
