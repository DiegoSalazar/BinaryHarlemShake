# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'harlem_bits/version'

Gem::Specification.new do |gem|
  gem.name          = "harlem_bits"
  gem.version       = HarlemBits::VERSION
  gem.authors       = ["Diego Salazar"]
  gem.email         = ["diego@greyrobot.com"]
  gem.description   = %q{It's the Harlem Shake. In Ruby. In the terminal.}
  gem.summary       = %q{Text based, binary, harlem shake. Yup.}
  gem.homepage      = "https://github.com/DiegoSalazar/BinaryHarlemShake"

  gem.files         = `git ls-files`.split($/) - ["HarlemShake.mp3"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.add_dependency 'colored'
  gem.add_dependency 'os'
end
