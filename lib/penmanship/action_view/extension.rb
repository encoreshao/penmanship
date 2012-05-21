module Penmanship
  module ActionView
    module Extension
      extend ActiveSupport::Concern
      
      module InstanceMethods
      
        # A helper that set the i18n columns
        def translate_attribute(klass, attribute_name)
          klass.human_attribute_name(attribute_name)
        end
        alias :ta :translate_attribute
      
        # A helper that renders the sec navigation highlight
        def main_nav(name, options = {}, &block)
          if @main_nav == name
            if options[:class]
              options[:class] += " active"
            else
              options[:class] = "active"
            end
          end
          content = capture(&block)
          content_tag(:li, content, options)
        end

        def sec_nav(name, options = {}, &block)
          if @sec_nav == name
            if options[:class]
              options[:class] += " active"
            else
              options[:class] = "active"
            end
          end
          content = capture(&block)
          content_tag(:li, content, options)
        end
      end
    end
  end
end

ActionView::Base.send :include, Penmanship::ActionView::Extension::InstanceMethods