class QueueWall < ApplicationRecord
  belongs_to :golf_range
  belongs_to :user
  has_one_attached :photo

  scope :by_range, ->(given_id) { where(golf_range_id: given_id) }
  scope :by_level_and_latest, -> () do
    select("queue_walls.*")
    .order("level DESC")
    .group("level")
    .maximum("created_at")
  end
  acts_as_votable
end
