# frozen_string_literal: true

module ExmoApi
  class Config
    def initialize
      load_defaults
    end

    attr_accessor :api_key,
                  :api_secret,
                  :api_endpoint,
                  :public_api_methods

    private

    def load_defaults
      @api_endpoint = 'https://api.exmo.com/v1'

      @api_key = 'test_api_key'
      @api_secret = 'test_api_secret'

      @public_api_methods = [
        :trades,
        :order_book,
        :ticker,
        :pair_settings,
        :currency
      ]
    end
  end
end
