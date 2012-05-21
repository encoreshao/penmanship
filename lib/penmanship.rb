require 'rails'
require "penmanship/action_controller/extension"
require "penmanship/action_view/extension"

module Penmanship
  if ::Rails.version > "3.1"
    class Engine < ::Rails::Engine; end
  else
    class Railtie < ::Rails::Railtie
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, Penmanship::ActionView::Extension
      end  
    end
  end
end
