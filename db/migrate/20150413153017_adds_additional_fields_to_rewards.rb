class AddsAdditionalFieldsToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :purchaseable, :boolean, default: false
    add_column :rewards, :purchaseable_for, :integer
  end
end
