class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :playwall_post

  scope :by_latest, -> () do
    order(created_at: :desc)
  end
end
