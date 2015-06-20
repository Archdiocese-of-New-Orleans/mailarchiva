module Mailarchiva

  class Message

    attr_accessor :blob_id, :volume_id, :size, :sentdate, :receiveddate, :archivedate, :from, :to, :subject, :cc, :bcc, :deliveredto, :messageid, :rcptto, :mailfrom

    def initialize(field_values)
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

  end
end