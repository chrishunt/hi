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
      stdout = capture_stdout do
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
      stdout = capture_stdout do
        logger.log message
      end

      expect(stdout).to be_empty
    end
  end

  private

  def capture_stdout
    captured = StringIO.new
    stdout = $stdout
    $stdout = captured

    yield

    $stdout = stdout
    captured.string
  end
end
