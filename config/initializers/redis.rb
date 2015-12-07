class RedisInstance
  include Singleton
  attr_reader :connection

  def initialize
    @connection = Redis.new(configs)
  end

  private

  def configs
    if Rails.env.production?
      {host: ENV['REDIS_PROVIDER'],
       port: 11918,
       password: ENV['REDIS_PASSWORD']}
    else
      {host: 'localhost',
        port: 6379}
    end
  end
end
