# frozen_string_literal: true

RSpec.describe ExmoApi::Config do
  let(:config) { described_class.new }

  it 'loads default values' do
    expect(config.api_endpoint).to_not be_nil
    expect(config.api_endpoint).to eq 'https://api.exmo.com/v1'
    expect(config.public_api_methods).to_not be_nil
  end
end
