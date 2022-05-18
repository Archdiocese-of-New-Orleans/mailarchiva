require "base64"
require "mail"

module Mailarchiva

  class Base

    attr_accessor :host, :key, :ssl, :port, :app_name

    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

end
