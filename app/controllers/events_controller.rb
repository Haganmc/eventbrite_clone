class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
