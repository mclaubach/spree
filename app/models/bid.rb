class Bid < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  belongs_to :choice, class_name: 'Team'

  before_save :is_event_occuring?

  def readonly?
    event.ended?
  end

  def is_event_occuring?
    !event.ended?
  end
end
