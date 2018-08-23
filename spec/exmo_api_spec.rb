# frozen_string_literal: true

RSpec.describe ExmoApi do
  let(:api_key) { 'some_long_long_test_api_key' }

  it 'has version number' do
    expect(ExmoApi::VERSION).to_not be_nil
  end

  it 'allows to configure gem' do
    expect(ExmoApi.configuration.api_key).to_not eq api_key

    ExmoApi.setup do |config|
      config.api_key = api_key
    end

    expect(ExmoApi.configuration.api_key).to eq api_key
  end
end
