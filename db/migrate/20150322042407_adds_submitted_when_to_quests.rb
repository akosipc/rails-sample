class AddsSubmittedWhenToQuests < ActiveRecord::Migration
  def change
    add_column :missions, :submitted_at, :datetime
  end
end
