class BidWorker
  include Sidekiq::Worker

  def perform(user_id, event_id, choice_id)
    BidCreator.new(user_id, event_id, choice_id).create!
  end
end
