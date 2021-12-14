class GolfRange < ApplicationRecord
  has_many :queue_walls, dependent: :destroy
  has_many :playwall_posts, dependent: :destroy

  geocoded_by :address
end
