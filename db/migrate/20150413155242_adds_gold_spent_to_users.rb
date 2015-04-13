class AddsGoldSpentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gold_spent, :integer, default: 0
  end
end
