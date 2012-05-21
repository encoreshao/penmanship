module Penmanship
  module ActionController
    module Extension

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods

        def main_nav_highlight(name)
          before_filter { |c| c.instance_variable_set(:@main_nav, name) }
        end

        def sec_nav_highlight(name)
          before_filter { |c| c.instance_variable_set(:@sec_nav, name) }
        end

      end
    end
  end
end

ActionController::Base.send :include, Penmanship::ActionController::Extension