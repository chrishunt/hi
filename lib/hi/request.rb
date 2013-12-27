require 'rack/request'

module Hi
  class Request
    attr_reader :env, :request

    def initialize(env)
      @env = env
      @request = Rack::Request.new(env)
    end

    def headers
      env.select { |key| key.start_with? 'HTTP_' }
    end

    def to_h
      {
        host: request.host,
        ip: request.ip,
        port: request.port,
        request_method: request.request_method,
        scheme: request.scheme,
        url: request.url,
        query_string: request.query_string,
        body: (request.body.string if request.body),
        content_length: request.content_length,
        media_type: request.media_type,
        referer: request.referer,
        user_agent: request.user_agent,
        xhr: request.xhr?,
        headers: headers,
      }
    end
  end
end
