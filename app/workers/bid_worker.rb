class BidWorker
  include Sidekiq::Worker

  def perform(user_id, event_id, choice_id)
    BidCreator.new(user_id, event_id, choice_id).create!
    serialized_bid = JSON.generate({user_id: user_id, event_id: event_id, choice_id: choice_id})
    MessageExchange.publish_bid_request(serialized_bid)
  end
end
