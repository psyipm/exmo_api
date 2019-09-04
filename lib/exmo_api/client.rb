module ExmoApi
  class Client
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def call(api_method, params)
      request = ExmoApi::Request.new(api_method, params)
      request.config = config

      request.perform
    end
  end
end
