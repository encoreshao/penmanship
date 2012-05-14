module Penmanship
  module HumanName
    
    def self.on_enable
      ActionController::Base.send :helper, RailsHelpers
    end
    
    module RailsHelpers
      def public_path(source)
        url_for("#{ActionController::Base.relative_url_root}#{source}")
      end
      
      def translate_attribute(klass, attribute_name)
        klass.human_attribute_name(attribute_name)
      end

      alias :ta :translate_attribute
    end
    
  end
end