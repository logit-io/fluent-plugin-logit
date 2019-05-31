$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "fluent-plugin-logit"
  s.version       = `cat VERSION`
  s.authors       = ["Logit"]
  s.email         = ["support@logit.io"]
  s.description   = %q{Logit output plugin for Fluentd}
  s.summary       = %q{Fluentd output plugin to store data with logit.io}
  s.homepage      = "https://github.com/logit/fluent-plugin-logit"
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd", '>= 0.14.0', '< 2'

  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "minitest"
end
