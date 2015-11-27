class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  accepts_nested_attributes_for :bids
end
