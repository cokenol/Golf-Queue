class QueueWall < ApplicationRecord
  belongs_to :golf_range
  belongs_to :user

  # scope :by_range, -> given_keyword { where}
end
