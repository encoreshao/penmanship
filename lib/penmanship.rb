require "penmanship/version"

module Penmanship
  if ::Rails.version > "3.1"
    require 'rails'
    class Engine < ::Rails::Engine
    end
  end
end
