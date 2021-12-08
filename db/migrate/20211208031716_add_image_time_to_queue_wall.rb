class AddImageTimeToQueueWall < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_walls, :image_time, :datetime
  end
end
