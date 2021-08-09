class InvitesController < ApplicationController
  def create
    invite = Invite.new
    invite.invited_event_id = params[:invited_event_id]
    invite.event_invitee_id = params[:event_invitee_id]

    invite.save
    redirect_back(fallback_location: root_path)
  end
end
