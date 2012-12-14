# -*- encoding: utf-8 -*-
require File.expand_path('../lib/human_date/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Zaytsev"]
  gem.email         = ["alexander@say26.com"]
  gem.description   = %q{View helpers to make your Dates and Times more human like}
  gem.summary       = %q{Display dates and times for humans, not robots!}
  gem.homepage      = "http://github.com/AlexanderZaytsev/human_date"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "human_date"
  gem.require_paths = ["lib"]
  gem.version       = HumanTime::VERSION

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "actionpack"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "timecop"
  gem.add_development_dependency "tzinfo"
end
