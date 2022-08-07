require 'faraday'
require 'json'
require_relative 'base'
require_relative 'message'

module Mailarchiva

  class RestClient < Base

    def initialize(args)
      super(args)
    end

    def search(params={})
      response = rest_client.get self.class.endpoint_url, params
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      parsed_response[:results].map{|field_values| Message.new(self, field_values)}
    end

    def get_message(volume_id, blob_id)
      blob_url = self.class.blob_url(volume_id, blob_id)
      client = rest_client({ 'Accept' => 'application/octet-stream' })
      client.get(blob_url).body
    end

    def self.endpoint_url
      "/api/v2/blobs"
    end

    def self.blob_url(volume_id, blob_id)
      "#{endpoint_url}/#{volume_id}/#{blob_id}"
    end

    def rest_client(headers = { 'Accept' => 'application/json' })
      connection = Faraday.new(url: self.class.url(ssl, host, port), ssl: ssl, proxy: proxy_url)
      connection.headers = headers.merge({'Authorization' => self.class.basic_auth(app_name, key)})
      connection
    end

    def self.basic_auth(app_name, key)
      Base64.strict_encode64("#{app_name}:#{key}")
    end

    def self.url(ssl, host, port)
      "%s://%s:%s" % [ssl ? 'https' : 'http', host, port]
    end

  end

end
