class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :content
      t.references :playwall_post, null: false, foreign_key: true
      t.references :queue_wall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
