module Penmanship
  module SearchLogic

    def self.on_enable
      if defined? ::SearchLogic
        ActionController::Base.send :helper, RailsHelpers
        ::SearchLogic::Search.send :include, SearchExtensions
      end
    end

    module SearchExtensions
      def self.included(base)
        base.instance_eval do
          include InstanceMethods
          extend ClassMethods
        end
      end
      
      module ClassMethods
        def human_name
          "Search"
        end
      end
      
      module InstanceMethods

        def human_attribute_name(name)
          klass.human_attribute_name(name)
        end
        
        def new_record?
          true
        end
      end
    end

    module RailsHelpers
      def i18n_order(search, options = {}, html_options = {})
        attribute_name = options[:attr] || options[:by]
        options[:as] ||= translate_attribute(search.klass, attribute_name)
        order(search, options, html_options)
      end
    end
  end
end