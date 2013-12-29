require 'thin'

module Hi
  class Server
    attr_reader :app

    CantStartServerError = Class.new(RuntimeError)

    MAX_ATTEMPTS = 5

    def initialize(app)
      @app = app
    end

    def start(port = app.port, attempts = 1)
      log "Starting server on port #{port}...\n\n"
      start! port
    rescue RuntimeError => e
      if attempts < MAX_ATTEMPTS
        log "\nUnable to start server, trying random port instead."
        start random_port, attempts + 1
      else
        raise CantStartServerError.new(e)
      end
    end

    def start!(port)
      Thin::Server.start '0.0.0.0', port, app
    end

    private

    def random_port
      1000 + Random.rand(9000)
    end

    def log(message)
      puts message unless ENV['RACK_ENV'] == 'test'
    end
  end
end
