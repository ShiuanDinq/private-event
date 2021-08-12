class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user).to_a
    @event = Event.find(params[:invited_event_id])
    @invitees = User.joins(:invited_events).where(:invited_events => {:name => @event.name}).to_a
    @invites = Invite.all.to_a
  end

  def show
    @user = User.find(params[:id])
    @event = Event.new
    @created_events = User.find(params[:id]).created_events.includes(:event_attendees, :event_invitees, :event_creator).to_a
    @invited_events = User.find(params[:id]).invited_events.includes(:event_attendees, :event_invitees, :event_creator).to_a

  end
end
