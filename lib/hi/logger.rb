require 'awesome_print'

module Hi
  # Logger that uses puts for strings, awesome print for everything else
  class Logger
    def log(message)
      print message unless testing
    end

    private

    def print(message)
      if message.is_a? String
        puts message
      else
        ap message
      end
    end

    def testing
      ENV['RACK_ENV'] == 'test'
    end
  end
end
