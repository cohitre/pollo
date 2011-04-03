# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pollo/version"

Gem::Specification.new do |s|
  s.name        = "pollo"
  s.version     = Pollo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cohitre", "Myron Marston"]
  s.email       = ["carlosrr@gmail.com", "myron.marston@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{The ultimate polling app}
  s.description = %q{Provides a nice, terse DSL for creating simple polling apps using sinatra.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "sinatra", '~> 1.2.1'
  s.add_development_dependency "rspec", '~> 2.5.0'
  s.add_development_dependency 'rack-test', '~> 0.5.7'
end
