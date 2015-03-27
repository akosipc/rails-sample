class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :name
      t.string :amount
      t.string :category

      t.string :quest_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
