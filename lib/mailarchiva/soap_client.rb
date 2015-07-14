require 'mailarchiva/base'
require 'mailarchiva/message'
require 'savon'

module Mailarchiva

  class SoapClient < Base

    HTTPI.adapter = :net_http

    attr_accessor :soap_client

    def initialize(args)
      super(args)
    end

    def search(params)
      params = {blob_category: 'email', max_results: 1000}.merge(params)
      params[:sent_before] = params[:sent_before].strftime("%Y-%m-%dT%T") if params.has_key?(:sent_before) && params[:sent_before].is_a?(Time)
      params[:sent_after] = params[:sent_after].strftime("%Y-%m-%dT%T") if params.has_key?(:sent_after) && params[:sent_after].is_a?(Time)
      search_response = soap_client.call(:search, message: params)
      search_results = search_results_from_response(search_response)
      logout
      search_results
    end

    def search_results_from_response(response)
      return [] if search_result_size == 0
      search_results_response = soap_client.call(:get_search_results, message: { blob_category: 'email', start: 0, end: search_result_size })
      search_results = [ search_results_response.body[:get_search_results_response][:return] ].flatten.compact
      search_results.map{|field_values| Message.new(self, field_values)}
    end

    def search_result_size
      search_result_size_response = soap_client.call(:get_search_result_size)
      search_result_size_response.body[:get_search_result_size_response][:return].to_i
    end

    def get_message(blob_id, volume_id)
      blob_response = soap_client.call(:get_blob, message: { 'blobID' =>{ 'blobID' => blob_id, 'volumeID' => volume_id } })
      encoded_message = blob_response.body[:get_blob_response][:return][:blob]
      decoded_message = Base64.decode64(encoded_message)
      Mail.new(decoded_message)
    end

    def wsdl
      "%s://%s:%s/services/search?wsdl" % [@ssl ? 'https' : 'http', @host, @port]
    end

    def soap_client
      @soap_client ||= begin
        auth_cookies = login(Savon.client(wsdl: wsdl))
        Savon.client(wsdl: wsdl, headers: { 'Cookie' => auth_cookies.to_s})
      end
    end

    def login(client)
      response = client.call(:login, message: { applicationname: @app_name, username: @user, password: @pass })
      response.http.cookies.first.name_and_value
    end

    def logged_in?
      @session_id.nil? ? false : soap_client.call(:is_logged_in).body[:is_logged_in_response][:return]
    end

    def logout
      soap_client.call(:logout, message: {})
      @soap_client = nil
    end

  end

end