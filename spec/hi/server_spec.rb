require 'hi/server'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe Hi::Server do
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

  it 'defaults to port 3000' do
    expect(app.port).to eq(3000)
  end

  it 'allows a customized port' do
    expect(described_class.new(1234).port).to   eq(1234)
    expect(described_class.new('1234').port).to eq(1234)
  end

  it 'uses default port when customized port is invalid' do
    expect(described_class.new(nil).port).to    eq(3000)
    expect(described_class.new('nope').port).to eq(3000)
    expect(described_class.new(-100).port).to   eq(3000)
  end
end
