require 'spec_helper'
require 'hi/app'
require 'hi/server'

describe Hi::Server do
  let(:app)    { Hi::App.new }
  let(:server) { described_class.new(app) }

  describe '#start' do
    it 'starts up the app' do
      expect(server).to receive(:start!).with app.port

      server.start
    end

    it 'tries to start again on a different port requested port is in use' do
      expect(server).to receive(:start!)
        .exactly(Hi::Server::MAX_ATTEMPTS).times
        .and_raise RuntimeError

      expect {
        server.start
      }.to raise_error Hi::Server::CantStartServerError
    end
  end
end
