class User < ApplicationRecord
  validates :name, presence: true
  has_many :created_events, foreign_key: :event_creator_id, class_name: "Event", dependent: :destroy
  has_many :invites, foreign_key: :event_invitee_id, dependent: :destroy
  has_many :invited_events, through: :invites
  has_many :attendances, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
