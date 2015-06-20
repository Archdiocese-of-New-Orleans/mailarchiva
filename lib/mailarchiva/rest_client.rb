require 'mailarchiva/base'

module Mailarchiva

  class RestClient < Base

    def initialize(args)
      super(args)
      raise "RestClient is not supported yet b/c it does not work on Mailarchiva as of 4.5.8"
    end

    def search(params={})
      response = @client.get api, params
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      parsed_response[:results]
      parsed_response.map{|field_values| Message.new(field_values)}
    end

    def api
      "/archiva3/api/blob"
    end

    def self.client(host, user, pass, ssl, port, app_name)
      connection = Faraday.new(url: url(ssl, host, port))
      connection.headers = {'Authorization' => basic_auth(app_name, user, pass), 'Accept' => 'application/json'}
      connection
    end

    def self.basic_auth(app_name, user, pass)
      Base64.strict_encode64("#{app_name}:#{user}:#{pass}")
    end

    def self.url(ssl, host, port)
      "%s://%s:%s" % [ssl ? 'https' : 'http', host, port]
    end

  end

end
