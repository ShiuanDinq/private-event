class Event < ApplicationRecord
  belongs_to :event_creator, class_name: "User" 
  has_many :invites, foreign_key: :invited_event_id
  has_many :event_invitee, through: :invites
end
