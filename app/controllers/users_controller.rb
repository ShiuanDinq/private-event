class UsersController < ApplicationController
  def index
    @users = User.all
    @event = Event.find(params[:invited_event_id])
  end

  def show
    @user = User.find(params[:id])
    @event = Event.new
  end
end
