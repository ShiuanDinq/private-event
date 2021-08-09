class Invite < ApplicationRecord
  belongs_to :event_invitee, class_name: "User"
  belongs_to :invited_event, class_name: "Event"
end
