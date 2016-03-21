class UserAchievement < ActiveRecord::Base
  has_many :achivements

  TYPES = ['Bid', 'Win', 'Loss', 'Leaderboard', 'Spree', 'Special']
end
