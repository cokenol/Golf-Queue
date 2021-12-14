class StatusUpdate < ApplicationRecord
  belongs_to :user

  scope :by_latest, -> () do
    order(created_at: :desc)
  end
end
