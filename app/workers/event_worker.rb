class EventWorker
  include Sidekiq::Worker

  def perform(event_id, user_id)
    PointCalculator.new(event_id, user_id).perform!
  end
end
