class Report < ApplicationRecord
  belongs_to :playwall_post
  belongs_to :queue_wall
  has_one_attached :photo

end
