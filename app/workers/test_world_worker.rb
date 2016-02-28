require 'securerandom'

class TestWorldWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #recurrence { minutely(15) }

  def perform
    5.times do
      User.create!(email: "#{SecureRandom.hex}@example.com", name: 'john', password: 'joejoejoe', password_confirmation: 'joejoejoe')
    end

    20.times do
      offset = rand(User.count)
      rand_record = User.offset(offset).first.id
      offset = rand(Event.count)
      rand_event = Event.offset(offset).first
      offset = rand(2)
      rand_choice = rand_event.teams[offset].id
      BidWorker.perform_async(rand_record, rand_event.id, rand_choice)
    end
  end
end
