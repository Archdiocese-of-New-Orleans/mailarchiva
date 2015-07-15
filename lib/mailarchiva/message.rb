require "mail"

module Mailarchiva

  class Message

    attr_accessor :client, :blob_id, :volume_id, :size, :sentdate, :receiveddate, :archivedate, :from, :to, :subject, :cc, :bcc, :deliveredto, :messageid, :rcptto, :mailfrom

    def initialize(client, field_values)
      @client = client
      field_values[:field_values].each do |field|
        key = field[:field]
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
      @blob_id = field_values[:id][:blob_id]
      @volume_id = field_values[:id][:volume_id]
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

    def to
      if undisclosed_recipients?
        mail_message.header.fields.select{|field| field.name =~ /received/i && field.value =~ /\sfor\s\W?([\w\._\-]+@[\w\._\-]+)\W/i }.collect{|field| field.value.match( /\sfor\s\W?([\w\._\-]+@[\w\._\-]+)\W/).captures.first}.uniq.join
      elsif raw_to
       raw_to.match(/<(.*)>/).captures.first
      end
    end

    def raw_message
      @raw_message ||= @client.get_message(@blob_id, @volume_id)
    end

    def mail_message
      @mail_message ||= @client.get_mail_message(@blob_id, @volume_id)
    end

    def undisclosed_recipients?
      raw_to.nil? || (raw_to =~ /undisclosed-recipients/i) == 1
    end

  end
end