$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "agilibox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "agilibox"
  s.version     = Agilibox::VERSION
  s.authors     = ["agilidée"]
  s.email       = ["contact@agilidee.com"]
  s.homepage    = "https://github.com/agilidee/agilibox"
  s.summary     = "Agilibox"
  s.description = "Agilibox"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "rails-i18n"
end
