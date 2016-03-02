class Result < ActiveRecord::Base
  belongs_to :bid
  belongs_to :user
  belongs_to :event
end
