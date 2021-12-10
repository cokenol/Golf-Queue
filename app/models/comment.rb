class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :playwall_post
end
