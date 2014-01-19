require 'forwardable'
require 'rack/request'

module Hi
  # Wrapper for rack request that exposes headers and body string
  class Request
    extend Forwardable

    ATTRIBUTES = [
      :host,
      :ip,
      :port,
      :request_method,
      :scheme,
      :url,
      :query_string,
      :body,
      :content_length,
      :media_type,
      :referer,
      :user_agent,
      :xhr?
    ]

    def_delegators :request, *ATTRIBUTES
    attr_reader :env, :request

    def initialize(env)
      @env = env
      @request = Rack::Request.new(env)
    end

    def headers
      env.select { |key| key.start_with? 'HTTP_' }
    end

    def body_string
      body.string if body
    end

    def to_h
      request_hash.merge({
        body: body_string,
        headers: headers,
      })
    end

    private

    def request_hash
      ATTRIBUTES.inject({}) { |hash, attr| hash[attr] = send(attr); hash }
    end
  end
end
