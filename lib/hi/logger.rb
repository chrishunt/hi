require 'awesome_print'

module Hi
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
