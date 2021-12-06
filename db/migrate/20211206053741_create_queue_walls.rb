class CreateQueueWalls < ActiveRecord::Migration[6.1]
  def change
    create_table :queue_walls do |t|
      t.integer :queue_length
      t.string :level
      t.references :golf_range, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
