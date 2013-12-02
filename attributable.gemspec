$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attributable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attributable"
  s.version     = Attributable::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Attributable."
  s.description = "TODO: Description of Attributable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "activerecord-postgres-hstore"

  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'

  if (RUBY_PLATFORM.eql?('java'))
    s.add_development_dependency 'activerecord-jdbcpostgresql-adapter'
  else
    s.add_development_dependency "pg"
  end

  s.add_development_dependency "capybara"
  s.add_development_dependency 'launchy'
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "email_spec"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "guard-rspec"
end
