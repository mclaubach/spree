class Bid < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :choice, class_name: 'Team'

  validates :user_id, uniqueness: { scope: :event_id, message: 'Only one bid per event allowed' }, on: :create
end
