class StatusUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :golf_range
  attr_accessor :start_date, :end_date, :starttime, :endtime

  scope :by_latest, -> () do
    order(created_at: :desc)
  end

  scope :where_latest, -> () do
    where('start_time >= ?', DateTime.now.strftime("%d %b %y"))
  end


end
