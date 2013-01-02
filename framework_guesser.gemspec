# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'framework_guesser/version'

Gem::Specification.new do |gem|
  gem.name          = "framework_guesser"
  gem.version       = FrameworkGuesser::VERSION
  gem.authors       = ["Martin Lipták"]
  gem.email         = ["mliptak@gmail.com"]
  gem.description   = %q{Detection of framework and javascript libraries from HTML code.}
  gem.summary       = %q{framework_guesser tries to detect frameworks and javascript libraries from HTML code and HTTP headers hash. Some extra information like server, server-side programming language, doctype, meta description and keywords are returned as well.}
  gem.homepage      = "https://github.com/martinliptak/framework_guesser"

  gem.add_dependency "nokogiri"
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "fakeweb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
