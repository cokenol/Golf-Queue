class AddLocationToStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    add_reference :status_updates, :golf_range, null: false, foreign_key: true
    remove_column :status_updates, :location
  end
end
