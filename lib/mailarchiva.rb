require_relative 'mailarchiva/rest_client'

module Mailarchiva

  class Client

    attr_accessor :client

    def initialize(args)
      args = { ssl: false, port: 8090, app_name: 'ROOT'}.merge(args)
      @client = RestClient.new(args)
    end

    # blob_category 'email'
    # query 'subject:test' | 'allsenders:test@test.com'
    # sort_field 'sentdate' | 'archivedate' | 'receiveddate'
    # sort_order 'sentdate' | 'archivedate' | 'receiveddate'
    # date_type 'sentdate' | 'archivedate' | 'receiveddate'
    # sent_before "2015-06-20T14:57:27" | Time object
    # sent_after "2015-06-20T14:57:27" | Time object
    # max_results 1000
    def search_by_subject(subject, params={})
      {query: "subject:\"#{subject}\""}.merge!(params)
      @client.search(params)
    end

    def search(params)
      @client.search(params)
    end

    def get_message(volume_id, blob_id)
      @client.get_message(volume_id, blob_id)
    end

  end

end