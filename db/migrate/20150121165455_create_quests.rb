class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string  :title
      t.text    :description
      t.string  :address
      t.float   :lat
      t.float   :long

      t.timestamps null: false
    end
  end
end
