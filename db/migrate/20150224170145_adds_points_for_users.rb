class AddsPointsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :score, :bigint, default: 0
  end
end
