class PlaywallPost < ApplicationRecord
  belongs_to :user
  belongs_to :golf_range
  has_many_attached :photos
  has_many :play_wall_reports, dependent: :destroy
  acts_as_favoritable
  has_many :comments, dependent: :destroy
  validates :caption, presence: true

  scope :by_latest, -> () do
    order(created_at: :desc)
  end

  scope :not_deleted, -> () do
    where(display: true)
  end
end
