$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attributable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attributable"
  s.version     = Attributable::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nwwatson@gmail.com"]
  s.homepage    = "https://github.com/nwwatson/attributable"
  s.summary     = "Helps track changes to ActiveRecord models"
  s.description = "Helps track changes to ActiveRecord models by creating activities and storing changes in a PostgreSQL hstore field"

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "pg"

  s.add_development_dependency 'rspec-rails', '~> 3.2.0'
  s.add_development_dependency 'rspec-its', '~> 1.1.0'
  s.add_development_dependency 'shoulda-matchers', '~> 2.8.0'
  s.add_development_dependency 'database_cleaner', '~> 1.4.0'
  s.add_development_dependency 'guard-rspec', '~> 4.5.0'
end
