require 'securerandom'

class TestWorldWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(4) }

  def perform
    # 5.times do
    #   User.create!(email: "#{SecureRandom.hex}@example.com", name: 'john', password: 'joejoejoe', password_confirmation: 'joejoejoe')
    # end

    teams  = ["Boston Red Sox",
             "New York Yankees",
             "Arizona Diamondbacks",
             "Atlanta Braves",
             "Baltimore Orioles",
             "Chicago Cubs",
             "Chicago White Sox",
             "Cincinnati Reds",
             "Cleveland Indians",
             "Colorado Rockies",
             "Detroit Tigers",
             "Florida Marlins",
             "Houston Astros",
             "Kansas City Royals",
             "Los Angeles Angels",
             "Los Angeles Dodgers",
             "Milwaukee Brewers",
             "Minnesota Twins",
             "New York Mets",
             "Oakland Athletics",
             "Philadelphia Phillies",
             "Pittsburgh Pirates",
             "San Diego Padres",
             "San Francisco Giants",
             "Seattle Mariners",
             "St. Louis Cardinals",
             "Tampa Bay Rays",
             "Texas Rangers",
             "Toronto Blue Jays",
             "Washington Nationals"]

    5.times do
      n1 = teams[rand(teams.size)]
      n2 = teams[rand(teams.size)]
      random_team1 = Team.where(title: n1).first_or_create(title: n1)
      random_team2 = Team.where(title: n1).first_or_create(title: n1)
      Event.create(teams: [random_team1, random_team2], title: 'who will win this baseball game', time: DateTime.now)
    end

    600.times do
      offset = rand(User.count)
      rand_record = User.offset(offset).first.id
      offset = rand(Event.where(winner_id: nil).count)
      rand_event = Event.where(winner_id: nil).offset(offset).first
      offset = rand(2)
      rand_choice = rand_event.teams[offset].id
      BidWorker.perform_async(rand_record, rand_event.id, rand_choice)
    end

    sleep 5

    4.times do
      offset = rand(Event.where(winner_id: nil).count)
      winner = rand(2)
      rand_event = Event.where(winner_id: nil).offset(offset).first
      rand_event.winner = rand_event.teams[winner]
      rand_event.save
    end
  end
end

# User.all.each do |user|
#   names = ['gawain', 'korbin', 'marc', 'jdg', 'ben', 'calvin', 'horse', 'butt', 'devil', 'god']
#   random_name = rand(names.size)

#   user.name = names[random_name]
#   user.save
# end
