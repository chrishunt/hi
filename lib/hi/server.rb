require 'awesome_print'
require 'hi/request'

module Hi
  class Server
    attr_reader :port

    DEFAULT_PORT = 3000

    def initialize(port = nil)
      @port = (port = port.to_i) > 0 ? port : DEFAULT_PORT
    end

    def call(env)
      log Hi::Request.new(env).to_h

      [ 200, { 'Content-Type' => 'text/plain' }, ['hi'] ]
    end

    private

    def log(request)
      unless ENV['RACK_ENV'] == 'test'
        ap "#{request[:request_method]} #{request[:url]} (#{Time.now})"
        ap request
      end
    end
  end
end
