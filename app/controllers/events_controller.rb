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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    puts "Event deleted"
    redirect_to events_path, notice: "Event was successfully deleted."
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_location, :event_date)
  end
end
