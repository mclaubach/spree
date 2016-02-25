class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_and_belongs_to_many :teams
  belongs_to :winner, class_name: 'Team'

  accepts_nested_attributes_for :bids

  scope :upcoming, -> { all }
end
