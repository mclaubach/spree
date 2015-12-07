class RedisInstance
  include Singleton
  attr_reader :connection

  def initialize
    @connection = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end

  private

  def uri
    URI.parse(ENV['REDISCLOUD_URL'] || "redis://localhost:6379/")
  end
end
