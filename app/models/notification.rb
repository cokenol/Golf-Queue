class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  scope :sorted_unread, -> () do
    order(read_at: :desc, created_at: :desc)
  end
end
