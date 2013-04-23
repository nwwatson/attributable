module Attributable
  class Engine < ::Rails::Engine
    isolate_namespace Attributable

    def self.activate
      ActionController::Base.send :include, Attributable::Helpers::ActivityHelper
    end

    config.autoload_paths += %W(#{config.root}/lib)

    config.to_prepare &method(:activate).to_proc


    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
