class StatsPresenter
  def initialize(events)
    @events = events
  end

  def total_stats
    stats = {}
    @events.each do |event|
      stats[event.id] = format_stats(get_stats(event.id))
    end
    stats
  end

  def get_stats(id)
    RedisInstance.instance.connection.hgetall("stats:#{id}")
  end

  def format_stats(stats)
    if stats
      total = stats.delete('total_bids').to_f
      percentage_stats = {}
      stats.each do |choice_id, stat|
        if total > 0
          per = (stat.to_f / total) * 100
          percentage_stats[choice_id.to_i] = per.round
        else
          percentage_stats[choice_id.to_i] = 50
        end
      end
      percentage_stats
    end
  end
end
