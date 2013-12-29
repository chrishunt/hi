require 'thin'

module Hi
  class Server
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def start
      Thin::Server.start '0.0.0.0', app.port, app
    end
  end
end
