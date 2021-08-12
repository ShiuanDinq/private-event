class EventsController < ApplicationController
  def index
    @upcoming = Event.upcoming.includes(:event_invitees, :event_attendees, :event_creator).to_a
    @past = Event.past.includes(:event_invitees, :event_attendees, :event_creator).to_a 
  end


  def show
    @event = Event.includes(:event_creator, :event_invitees, :event_attendees).find(params[:id])
    @invitees = User.joins(:invited_events).where(:invited_events => {:name => @event.name}).to_a
    @attendees = User.joins(:attended_events).where(:attended_events => {:name => @event.name}).to_a
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to root_path
  end


  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :venue)
  end
end
