class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :playwall_post
  validates :content, presence: true

  scope :by_latest, -> () do
    order(created_at: :desc)
  end
end
