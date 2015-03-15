class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :status, default: "Accepted"

      t.integer :user_id
      t.integer :quest_id

      t.timestamps null: false
    end
  end
end
