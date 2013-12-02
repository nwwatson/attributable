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
  s.summary     = "Helps track changes to ActiveRecord models"
  s.description = "Helps track changes to ActiveRecord models by creating activities and storing changes in a PostgreSQL hstore field"

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
