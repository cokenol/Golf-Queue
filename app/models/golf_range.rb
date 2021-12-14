class GolfRange < ApplicationRecord
  has_many :queue_walls, dependent: :destroy
  has_many :playwall_posts, dependent: :destroy
  has_many :status_updates, dependent: :destroy
end
