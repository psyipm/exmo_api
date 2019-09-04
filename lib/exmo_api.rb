# frozen_string_literal: true

require 'exmo_api/version'

module ExmoApi
  autoload :Config, 'exmo_api/config'
  autoload :Request, 'exmo_api/request'
  autoload :Client, 'exmo_api/client'

  def self.configuration
    @configuration ||= Config.new
  end

  # @example
  #   ExmoApi.setup do |config|
  #     config.api_endpoint = 'https://api.exmo.com/v1'
  #   end
  #
  def self.setup
    yield configuration
  end
end
