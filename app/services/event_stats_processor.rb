module EventStatsProcessor
  extend self

  def process!
    running_events.each do |event|
      stats = collect_stats(event)
      update_stats!(event, stats)
    end
  end

  private

  def update_stats!(event, stats)
    RedisInstance.instance.connection.hmset("stats:#{event.id}", stats.flatten)
  end

  def collect_stats(event)
    stats = {}
    total_bids = event.bids
    stats[:total_bids] = event.bids.count
    distribution = event.teams.each do |team|
      stats[team.id] = total_bids.where(choice: team.id).count
    end
    stats
  end

  def running_events
    Event.all
  end
end
