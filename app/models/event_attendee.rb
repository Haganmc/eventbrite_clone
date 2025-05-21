class EventAttendee < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :user
end
