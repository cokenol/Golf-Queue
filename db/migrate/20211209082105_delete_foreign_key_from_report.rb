class DeleteForeignKeyFromReport < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :reports, :playwall_posts
    rename_table :reports, :queue_wall_reports
  end
end
