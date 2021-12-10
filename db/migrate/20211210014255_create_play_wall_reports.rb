class CreatePlayWallReports < ActiveRecord::Migration[6.1]
  def change
    create_table :play_wall_reports do |t|
      t.text :content
      t.references :playwall_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
