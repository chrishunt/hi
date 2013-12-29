require 'spec_helper'
require 'hi/app'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe Hi::App do
  include Rack::Test::Methods

  def app
    described_class.new
  end

  [:get, :put, :post].each do |method|
    it "responds to #{method.to_s.upcase}" do
      send(method, '/')

      expect(last_response).to be_ok
      expect(last_response.body).to eq('hi')
    end
  end

  it 'responds to any route' do
    get '/some/random/route'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('hi')
  end

  it 'has a default port' do
    expect(app.port).to eq described_class::DEFAULT_PORT
  end

  it 'allows a customized port' do
    expect(described_class.new(1234).port).to   eq(1234)
    expect(described_class.new('1234').port).to eq(1234)
  end

  it 'uses default port when customized port is invalid' do
    expect(described_class.new(nil).port).to    eq described_class::DEFAULT_PORT
    expect(described_class.new('nope').port).to eq described_class::DEFAULT_PORT
    expect(described_class.new(-100).port).to   eq described_class::DEFAULT_PORT
  end
end
