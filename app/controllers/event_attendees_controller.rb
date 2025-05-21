class EventAttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @event_attendee = @event.event_attendees.build(user: current_user)

    if @event_attendee.save
      redirect_to @event, notice: "You have successfully signed up for the event."
    else
      redirect_to @event, alert: "There was an error signing up for the event."
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_attendee = @event.event_attendees.find_by(user: current_user)
    @event_attendee.destroy

    redirect_to @event, notice: "You have successfully canceled your signup for the event."
  end
end
