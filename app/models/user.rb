class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :playwall_posts, dependent: :destroy
  has_many :queue_walls, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :status_updates, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritor
  acts_as_voter
  has_friendship
  has_many :notifications, as: :recipient
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_username_email,
    against: [ :username, :email ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def fbsignup
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      name_arr = auth.info.name.downcase.split
      username_arr = []
      username_arr << name_arr.first
      name_arr[1..].each { |name| username_arr << name.first }
      username_arr << rand(0..999)
      user.username = username_arr.join # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
