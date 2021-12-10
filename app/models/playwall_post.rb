class PlaywallPost < ApplicationRecord
  belongs_to :user
  belongs_to :golf_range
  has_many_attached :photos
  has_many :play_wall_reports
  acts_as_favoritable

  scope :by_latest, -> () do
    order(created_at: :desc)
  end
end
