class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_and_belongs_to_many :teams
  accepts_nested_attributes_for :bids
end
