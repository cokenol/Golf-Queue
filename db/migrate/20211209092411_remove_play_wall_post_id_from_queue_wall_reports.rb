class RemovePlayWallPostIdFromQueueWallReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :queue_wall_reports, :playwall_post_id
  end
end
