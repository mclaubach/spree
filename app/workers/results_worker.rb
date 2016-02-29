class ResultsWorker
  include Sidekiq::Worker

  def perform(event_id)
    ResultsProcessor.new(event_id).process!
  end
end
