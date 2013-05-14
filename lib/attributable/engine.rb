module Attributable
  class Engine < ::Rails::Engine
    isolate_namespace Attributable

    def self.activate
      ActionController::Base.send :include, Attributable::AttributableHelper
    end

    config.to_prepare &method(:activate).to_proc
  end
end
