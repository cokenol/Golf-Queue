class CreateStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :status_updates do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
