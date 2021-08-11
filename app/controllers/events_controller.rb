class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @attendances = Attendance.all
    @invites = Invite.all
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



  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :venue)
  end
end
