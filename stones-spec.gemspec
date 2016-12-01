# coding: utf-8
lib = File.expand_path('./lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'stones-spec'
  spec.version       = '1.0.1'
  spec.authors       = ['Mumuki']
  spec.email         = ['mumuki@mumuki.org']
  spec.summary       = 'Minimal test framework for Gobstones'
  spec.homepage      = 'http://github.com/mumuki/stones-spec'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/**']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-stones', '~> 0.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rspec', '~> 3.4'
end



