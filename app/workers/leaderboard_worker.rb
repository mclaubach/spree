class LeaderboardWorker
  include Sidekiq::Worker

  def perform
    LeaderboardProcessor.process!
  end
end
