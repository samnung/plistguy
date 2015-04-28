# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'plistguy/version'


Gem::Specification.new do |spec|
  spec.name          = 'plistguy'
  spec.version       = Plistguy::VERSION
  spec.authors       = ['Roman Kříž']
  spec.email         = ['samnung@gmail.com']

  spec.summary       = %q{plistguy, wrapper around PlistBuddy to support shell pipes as input}
  spec.description   = %q{plistguy, wrapper around PlistBuddy to support shell pipes as input
                          so now you can write `cat some.plist | plistguy -c "Print :0"` and it works.}
  spec.homepage      = "https://github.com/samnung/plistguy"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.add_runtime_dependency 'bundler', '~> 1.9'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
