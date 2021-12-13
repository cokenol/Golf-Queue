class QueueWall < ApplicationRecord
  belongs_to :golf_range
  belongs_to :user
  has_many :reports
  has_one_attached :photo

  scope :by_range, ->(given_id) { where(golf_range_id: given_id) }

  scope :by_level_and_latest, -> () do
    select('DISTINCT ON ("level") *')
    .order(:level, created_at: :desc)
  end

  acts_as_votable

  validates :queue_length, inclusion: { in: (0..30) }
end
