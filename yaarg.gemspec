require 'yaarg/version'
Gem::Specification.new do |spec|
  spec.name        = 'yaarg'
  spec.version     = Yaarg::VERSION
  spec.date        = '2017-03-04'
  spec.summary     = "Yet Antoher AdminLTE Ruby Gem"
  spec.description = "Because all others is outated..."
  spec.authors     = ["Jefferson Campos"]
  spec.email       = 'jefferson@jeffersoncampos.eti.br'
  # spec.files       = ["lib/yaarg.rb", "lib/yaarg/version.rb"]
  # spec.files       = Dir['lib/*']
  spec.files       = Dir['lib/templates/**/*.rb'] +
                  Dir['lib/templates/**/*.erb'] +
                  Dir['lib/templates/**/*.js'] +
                  ["lib/yaarg.rb",
                   "lib/yaarg/version.rb"
                  ]
  spec.homepage    = 'https://github.com/foguinhoperuca/yaarg'
  spec.license     = 'MIT'
  spec.executables << 'yaarg'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "os"
end
