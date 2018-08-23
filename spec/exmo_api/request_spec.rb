# frozen_string_literal: true

RSpec.describe ExmoApi::Request do
  let(:request) { described_class.new(:ticker) }
  let(:ticker_response_body) { File.read('spec/stubs/ticker.json') }

  let(:request_headers) { File.read('spec/stubs/order_create_request_headers.json') }
  let(:order_create_response_body) { File.read('spec/stubs/order_create.json') }

  before(:each) do
    stub_request(:post, Regexp.new('/ticker'))
      .to_return(status: 200, body: ticker_response_body, headers: {})

    stub_request(:post, Regexp.new('/order_create'))
      .with(
        body: 'pair=BTC_USD&quantity=1&price=6440&type=buy&nonce=1535057238255730',
        headers: JSON.parse(request_headers)
      )
      .to_return(status: 200, body: order_create_response_body, headers: {})
  end

  it 'performs http request to public method' do
    result = request.perform

    expect(result.dig('BTC_USD', 'last_trade')).to eq '6443.69126692'
  end

  it 'should perform http request with signature to private method' do
    params = { pair: 'BTC_USD', quantity: 1, price: 6440, type: :buy, nonce: '1535057238255730' }
    request = described_class.new(:order_create, params)

    expect(request).to receive(:params).and_return(params)

    result = request.perform

    expect(result.dig('result')).to eq true
  end
end
