class PlaywallPost < ApplicationRecord
  belongs_to :user
  belongs_to :golf_range
  has_many_attached :photos
  acts_as_favoritable
end
