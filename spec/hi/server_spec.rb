require 'hi/server'
require 'rack/test'

describe Hi::Server do
  include Rack::Test::Methods

  def app
    Hi::Server.new
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
end
