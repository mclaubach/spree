class EventStatsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(5) }

  def perform
    EventStatsProcessor.process!
  end
end
