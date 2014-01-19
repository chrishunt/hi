require 'hi/request'
require 'hi/logger'

module Hi
  # Main app; http server that prints requests as they come in
  class App
    attr_reader :port, :logger

    DEFAULT_PORT = 3000

    def initialize(port = nil, logger = Hi::Logger.new)
      @port = (port = port.to_i) > 0 ? port : DEFAULT_PORT
      @logger = logger
    end

    def call(env)
      request = Hi::Request.new(env).to_h

      log "#{request[:request_method]} #{request[:url]} (#{Time.now})"
      log request

      [ 200, { 'Content-Type' => 'text/plain' }, ['hi'] ]
    end

    def log(message)
      logger.log message
    end
  end
end
