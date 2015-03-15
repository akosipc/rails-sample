class AddsFilepickerUrlToMission < ActiveRecord::Migration
  def change
    add_column :missions, :filepicker_url, :string
  end
end
