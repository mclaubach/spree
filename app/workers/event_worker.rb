class EventWorker
  include Sidekiq::Worker

  def perform(event, user)
    PointCalculator.new(event, user).perform!
  end
end
