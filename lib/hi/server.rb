require 'awesome_print'

module Hi
  class Server
    attr_reader :port

    def initialize(port = nil)
      @port = (port = port.to_i) > 0 ? port : 3000
    end

    def call(env)
      log parse_request(env)

      [ 200, { 'Content-Type' => 'text/plain' }, ['hi'] ]
    end

    private

    def log(request)
      unless ENV['RACK_ENV'] == 'test'
        ap "#{request[:request_method]} #{request[:url]} (#{Time.now})"
        ap request
      end
    end

    def parse_request(env)
      request = Rack::Request.new(env)

      {
        host: request.host,
        ip: request.ip,
        port: request.port,
        request_method: request.request_method,
        scheme: request.scheme,
        url: request.url,
        query_string: request.query_string,
        body: request.body.string,
        content_length: request.content_length,
        media_type: request.media_type,
        referer: request.referer,
        user_agent: request.user_agent,
        xhr: request.xhr?,
      }
    end
  end
end
