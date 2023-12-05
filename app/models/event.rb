class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :rsvps
  has_many :attendees, through: :rsvps, source: :user

  scope :future, -> { where('date > ?', Time.now) }
  scope :past,   -> { where('date < ?', Time.now) }
  # Ex:- scope :active, -> {where(:active => true)}
end
