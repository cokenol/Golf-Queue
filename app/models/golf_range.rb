class GolfRange < ApplicationRecord
  has_many :queue_walls, dependent: :destroy
end
