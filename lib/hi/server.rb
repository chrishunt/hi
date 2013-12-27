require 'awesome_print'
require 'hi/request'

module Hi
  class Server
    attr_reader :port

    def initialize(port = nil)
      @port = (port = port.to_i) > 0 ? port : 3000
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
