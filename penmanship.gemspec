# -*- encoding: utf-8 -*-
require File.expand_path('../lib/penmanship/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "penmanship"
  gem.authors       = ["Enocre Shao"]
  gem.email         = ["encore.shao@gmail.com"]
  gem.description   = %q{A simple integration bootstrap, Add some cookies.}
  gem.summary       = %q{A simple integration bootstrap, And some cookies. Exp: nav theme, human..}
  gem.homepage      = "https://github.com/encoreshao/penmanship.git"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = Penmanship::VERSION
end
