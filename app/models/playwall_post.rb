class PlaywallPost < ApplicationRecord
  belongs_to :user
  belongs_to :golf_range
  has_many :reports
  has_many_attached :photos
  acts_as_favoritable

  scope :by_latest, -> () do
    order(created_at: :desc)
  end
end
