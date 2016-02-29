class ResultsProcessor
  def initialize(event_id)
    @event_id = event_id
  end

  def process!
    insert_records!
    update_counters!
    LeaderboardWorker.perform_async
  end

  def insert_records!
    records = format_bids
    sql = "INSERT INTO results (`event_id`, `bid_id`, `user_id`, `correct`) VALUES #{records.join(", ")}"
    Result.connection.execute(sql)
  end

  def format_bids
    @bids.map do |bid|
      "(#{event.id}, #{bid.id}, #{bid.user_id}, #{winner?(bid)})"
    end
  end

  def winner?(bid)
    bid.team_id == event.team_id
  end

  def update_counters!
    counter_update!(winners, true)
    counter_update!(losers, false)
  end

  def counter_update
    UserCounter.where(user_id: winners).update_all("spree = spree + 1, wins = wins + 1, total_matches = total_matches + 1")
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
