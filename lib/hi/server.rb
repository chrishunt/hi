require 'awesome_print'

module Hi
  class Server
    attr_reader :port

    def initialize(port = nil)
      @port = (port = port.to_i) > 0 ? port : 3000
    end

    def call(env)
      [ 200,
        { 'Content-Type' => 'text/plain' },
        ['hi']
      ]
    end
  end
end
