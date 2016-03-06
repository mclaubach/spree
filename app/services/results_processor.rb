class ResultsProcessor
  def initialize(event_id)
    @event_id = event_id
  end

  def process!
    return if bids.empty?
    insert_records!
    update_counters!
    #LeaderboardWorker.perform_async
  end

  def insert_records!
    records = format_bids
    sql = "INSERT INTO results (event_id, bid_id, user_id, correct, created_at, updated_at) VALUES #{records.join(", ")}"
    Result.connection.execute(sql)
  end

  def format_bids
    bids.map do |bid|
      "(#{event.id}, #{bid.id}, #{bid.user_id}, #{winner?(bid)}, '#{Time.now}', '#{Time.now}')"
    end
  end

  def winner?(bid)
    bid.choice_id == event.winner_id
  end

  def update_counters!
    winner_counter_update!
    loser_counter_update!
  end

  def winner_counter_update!
    UserCounter.where(user_id: winners).update_all("spree = spree + 1, wins = wins + 1, total_bids = total_bids + 1")
  end

  def loser_counter_update!
    UserCounter.where(user_id: losers).update_all("spree = 0, losses = losses + 1, total_bids = total_bids + 1")
  end

  private

  def event
    @event ||= Event.find(@event_id)
  end

  def bids
    @bids ||= Bid.where(event: event)
  end

  def winners
    @winners ||= Result.where(event_id: event.id, correct: true).pluck(:user_id)
  end

  def losers
    @losers ||= Result.where(event_id: event.id, correct: false).pluck(:user_id)
  end
end
