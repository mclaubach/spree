class PointCalculator
  def initialize(event_id, user_id)
    @event = Event.find(event_id)
    @user = User.find(user_id)
    @bid = Bid.where(event: @event, user: @user).first
  end

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
    @event.winner == @bid.choice
  end

  private

  def redis_key
    "spree:#{@user.id}"
  end

  def redis
    RedisInstance.instance.connection
  end
end
