MESSAGING_SERVICE = MessagingService.new(ENV.fetch("AMQP_URL"))
MESSAGING_SERVICE.start
