class Event < ApplicationRecord
  validates :name, presence: true
  validates :venue, presence: true
  validates :date, presence: true
  validates :description, presence: true
  belongs_to :event_creator, class_name: "User" 
  has_many :invites, foreign_key: :invited_event_id, dependent: :destroy
  has_many :event_invitees, through: :invites
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :event_attendees, through: :attendances
  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
end
