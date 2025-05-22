class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :event_attendees, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee


  scope :upcoming, -> { where("event_date > ?", Time.current).order(:event_date) }
  scope :past, -> { where("event_date <= ?", Time.current).order(event_date: :desc) }
end
