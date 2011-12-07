# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/lettering/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'rack-lettering'
  gem.version     = Rack::Lettering::VERSION
  gem.author      = "Steve Agalloco"
  gem.email       = 'steve.agalloco@gmail.com'
  gem.homepage    = 'https://github.com/spagalloco/rack-lettering'
  gem.summary     = %q{Rack Middleware for inserting Lettering.js style syntax into a response body}
  gem.description = gem.summary

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.require_paths = ['lib']

  gem.add_dependency 'rack'
  gem.add_dependency 'nokogiri', '~> 1.5'

  gem.add_development_dependency 'rdiscount', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'simplecov', '~> 0.5'
  gem.add_development_dependency 'yard', '~> 0.7'
end
