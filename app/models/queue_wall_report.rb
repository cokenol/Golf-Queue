class QueueWallReport < ApplicationRecord
  belongs_to :queue_wall
  has_one_attached :photo
end
