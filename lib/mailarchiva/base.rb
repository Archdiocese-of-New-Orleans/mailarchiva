require "base64"
require "mail"

module Mailarchiva

  class Base

    attr_accessor :host, :user, :pass, :ssl, :port, :app_name

    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

end
