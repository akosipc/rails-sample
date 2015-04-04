class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :based_on

      t.integer :based_at

      t.timestamps null: false
    end
  end
end
