class MessagingService
  def initialize(amqp_url)
    @bunny = Bunny.new(amqp_url)
    @bunny.start
    at_exit { @bunny.stop }
  end

  attr_reader :bunny

  def publish_bid_request(message)
    bid_exchange.publish(message)
  end

  def bid_exchange
    @bid_exchange ||=
      channel.exchange("bid", passive: true)
  end

  def channel
    @channel ||= bunny.channel
  end
end
