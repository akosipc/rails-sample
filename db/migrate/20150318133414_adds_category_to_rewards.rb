class AddsCategoryToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :category, :string
  end
end
