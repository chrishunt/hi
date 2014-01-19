require 'spec_helper'
require 'hi/logger'

describe Hi::Logger do
  let(:logger)  { described_class.new }
  let(:message) { 'Hello logger' }

  context "when RACK_ENV is not 'test'" do
    before do
      ENV['RACK_ENV'] = 'the real deal'
    end

    it 'prints message to standard out' do
      stdout = Mute::IO.capture_stdout do
        logger.log message
      end

      expect(stdout).to include message
    end
  end

  context "when RACK_ENV is 'test'" do
    before do
      ENV['RACK_ENV'] = 'test'
    end

    it 'does not print message to standard out' do
      stdout = Mute::IO.capture_stdout do
        logger.log message
      end

      expect(stdout).to be_empty
    end
  end
end
