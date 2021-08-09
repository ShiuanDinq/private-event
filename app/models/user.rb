class User < ApplicationRecord
  has_many :created_events, foreign_key: :event_creator_id, class_name: "Event"
  has_many :invites, foreign_key: :event_invitee_id
  has_many :invited_events, through: :invites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
