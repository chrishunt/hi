require 'spec_helper'
require 'hi/request'

describe Hi::Request do
  describe '#to_h' do
    it 'includes all the important bits' do
      hash = described_class.new({}).to_h

      expect(hash).to include :headers
      expect(hash).to include :body
      expect(hash).to include :url
    end
  end

  describe '#headers' do
    it 'returns all headers from the environment' do
      headers = {
        'HTTP_MY_HEADER'       => 'is present',
        'HTTP_MY_OTHER_HEADER' => 'is also present',
      }

      request = described_class.new \
        headers.merge('NOT_A_HEADER' => 'is not present')

      expect(request.headers).to eq headers
    end
  end

  describe '#host' do
    it 'returns the host passed in the environment' do
      host = 'amazing.dev'

      request = described_class.new('HTTP_HOST' => host)

      expect(request.host).to eq host
    end
  end
end
