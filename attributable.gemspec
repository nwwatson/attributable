$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attributable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attributable"
  s.version     = Attributable::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nick@entropi.co"]
  s.homepage    = "https://github.com/entropillc/attributable"
  s.summary     = "TODO: Summary of Attributable."
  s.description = "TODO: Description of Attributable."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  s.add_development_dependency "rb-fsevent", "~> 0.9.3"
  s.add_development_dependency "rspec-rails", "~> 2.13.0"
  s.add_development_dependency "factory_girl_rails", "~> 4.2.1"
  s.add_development_dependency "capybara", "~> 2.1.0"
  s.add_development_dependency "database_cleaner", "~> 0.9.1"
  s.add_development_dependency "guard-rspec", "~> 2.5.3"
  
end
