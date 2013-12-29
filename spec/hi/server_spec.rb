require 'spec_helper'
require 'hi/app'
require 'hi/server'

describe Hi::Server do
  let(:app)    { Hi::App.new }
  let(:server) { described_class.new(app) }

  describe '#start' do
    it 'starts up the app on a Thin server' do
      Thin::Server.should_receive(:start).with '0.0.0.0', app.port, app

      server.start
    end
  end
end
