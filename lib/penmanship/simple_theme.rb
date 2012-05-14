module Penmanship
  module SimpleTheme
    
    def self.on_enable
      ActionController::Base.send :extend, ControllerExtensions::ClassMethods
      ActionController::Base.send :helper, RailsHelpers
    end
    
    module ControllerExtensions
      module ClassMethods
        def sec_nav_highlight(name)
          class_eval do 
            before_filter { |c| c.instance_variable_set(:@sec_nav, name) }
          end
        end

        def main_nav_highlight(name)
          class_eval do 
            before_filter { |c| c.instance_variable_set(:@main_nav, name) }
          end
        end
      end
    end
    
    module RailsHelpers
      def sec_nav(name, options = {}, &block)
        if @sec_nav == name
          if options[:class]
            options[:class] += " active"
          else
            options[:class] = "active"
          end
        end
        content = capture(&block)
        concat content_tag(:li, content, options)
      end
      
      def main_nav(name, options = {}, &block)
        if @main_nav == name
          if options[:class]
            options[:class] += " active"
          else
            options[:class] = "active"
          end
        end
        content = capture(&block)
        concat content_tag(:li, content, options)
      end
    end
    
  end
end