class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee


  scope :upcoming, -> { where("date > ?", Time.current).order(:date) }
  scope :past, -> { where("date <= ?", Time.current).order(date: :desc) }
end
