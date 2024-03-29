require "mail"

module Mailarchiva

  class Message

    attr_accessor :client, :blob_id, :volume_id, :size, :sentdate, :receiveddate, :archivedate, :from, :to, :subject, :cc, :bcc, :deliveredto, :messageid, :rcptto, :mailfrom

    def initialize(client, field_values)
      @client = client
      field_values[:list].each do |field|
        key = field[:field]#.gsub(/(.)([A-Z])/,'\1_\2').downcase # Convert camelCase to snake_case
        value = field[:value]
        case key
          when /date/
            value = DateTime.parse(value) if value
          when /size/
            value = value.to_i if value
          else
            value
        end
        instance_variable_set("@#{key}", value) if respond_to?(key.to_sym)
      end
      @blob_id = field_values[:blobid][:uniqueid]
      @volume_id = field_values[:blobid][:volumeid]
    end

    def raw_from
      @from
    end

    def from
      raw_from && raw_from.match(/<(.*)>/).captures.first
    end

    def raw_to
      @to
    end

    def mail_message
      Mail.new raw_message
    end

    def to
      if undisclosed_recipients?
        mail_message.header.fields.select{|field| field.name =~ /received/i && field.value =~ /\sfor\s\W?([\w\._\-]+@[\w\._\-]+)\W/i }.collect{|field| field.value.match( /\sfor\s\W?([\w\._\-]+@[\w\._\-]+)\W/).captures.first}.uniq.compact
      elsif raw_to
       [raw_to.match(/<(.*)>/).captures.first].compact
      end
    end

    def raw_message
      @client.get_message(@volume_id, @blob_id)
    end

    # BCC workaround
    def message_for
      mail_message.header.select{ |field| field.name.downcase == 'received' && field.info =~ /\sfor\s.+@.+/  }.collect{ |field| field.info.match(/for\s<?(.+@.+);?>?/).captures }.flatten.compact.uniq.map{|email_address| email_address.gsub(/[<;>]/, '') }
    rescue NoMethodError
      []
    end

    def undisclosed_recipients?
      raw_to.nil? || (raw_to =~ /undisclosed-recipients/i) == 1
    end

  end
end