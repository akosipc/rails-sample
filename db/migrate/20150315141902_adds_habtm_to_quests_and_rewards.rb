class AddsHabtmToQuestsAndRewards < ActiveRecord::Migration
  def change
    remove_column :rewards, :quest_id

    create_table :quests_rewards, id: false do |t|
      t.integer :quest_id
      t.integer :reward_id
    end
  end
end
