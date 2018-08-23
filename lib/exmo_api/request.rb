# frozen_string_literal: true

require 'net/http'
require 'json'
require 'openssl'

module ExmoApi
  class Request
    attr_reader :api_method

    def initialize(api_method, params = {})
      @api_method = api_method
      @params = params
    end

    def perform
      JSON.parse response.body.to_s
    end

    def response
      @response ||= http.request(build_request)
    end

    private

    def http
      @http ||= Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true if uri.scheme == 'https'
      @http
    end

    def build_request
      request.body = post_data

      request
    end

    def post_data
      @post_data ||= URI.encode_www_form(params)
    end

    def params
      @params.merge(nonce: Time.now.strftime('%s%6N'))
    end

    def request
      @request ||= Net::HTTP::Post.new(uri.path, headers)
    end

    def headers
      return {} if public_method?

      digest = OpenSSL::Digest.new('sha512')
      signature = OpenSSL::HMAC.hexdigest(digest, config.api_secret, post_data)

      { 'Sign' => signature, 'Key' => config.api_key }
    end

    def public_method?
      config.public_api_methods.include?(api_method.to_sym)
    end

    def uri
      URI.parse([config.api_endpoint, api_method].join('/'))
    end

    def config
      ExmoApi.configuration
    end
  end
end
