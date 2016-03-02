class Bid < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  belongs_to :choice, class_name: 'Team'
end
