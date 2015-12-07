class PointCalculator < Struct.new(:user, :event, :bid)
  def perform!
    if picked_winner?
      if redis.exists(redis_key)
        redis.incr(redis_key)
      else
        redis.set(redis_key, 1)
      end
    end
  end

  def picked_winner?
    event.winner == bid.choice
  end

  private

  def redis_key
    "spree:#{user.id}"
  end

  def redis
    RedisInstance.instance.connection
  end
end
