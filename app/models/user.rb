class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :playwall_posts, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritor
  acts_as_voter
end
