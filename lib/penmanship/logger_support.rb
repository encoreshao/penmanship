module Penmanship
  module LoggerSupport
    def self.included(base)
      base.instance_eval do
        extend ClassMethods
        include InstanceMethods
      end
    end
    
    module ClassMethods
      def logger
        @logger ||= Rails.logger || Logger.new(STDOUT)
      end
    end
    
    module InstanceMethods
      def logger
        @logger ||= self.class.logger
      end
    end
  end
  
  class SmartLogger
    require "logger"
    def self.create(name)
      case name
      when "STDOUT"
        Logger.new(STDOUT)
      when /(\w+)/
        Logger.new(Rails.root.join("log", "#{$1}.log"))
      when /(\w+\.\w+)/
        Logger.new(Rails.root.join("log", $1))
      else
        Logger.new(Rails.root.join("log", "#{Rails.env}.log"))
      end
    end
  end
  
end