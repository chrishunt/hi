require 'awesome_print'

module Hi
  class Logger
    def log(message)
      ap message unless testing
    end

    private

    def testing
      ENV['RACK_ENV'] == 'test'
    end
  end
end
