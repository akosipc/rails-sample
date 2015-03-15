class AddsLevelToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :level, :integer
  end
end
