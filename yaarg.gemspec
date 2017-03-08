Gem::Specification.new do |s|
  s.name        = 'yaarg'
  s.version     = '0.0.2'
  s.date        = '2017-03-04'
  s.summary     = "Yet Antoher AdminLTE Ruby Gem"
  s.description = "Because all others is outated..."
  s.authors     = ["Jefferson Campos"]
  s.email       = 'jefferson@jeffersoncampos.eti.br'
  # s.files       = ["lib/yaarg.rb", "lib/yaarg/version.rb"]
  # s.files       = Dir['lib/*']
  s.files       = Dir['lib/templates/**/*.rb'] +
                  Dir['lib/templates/**/*.erb'] +
                  Dir['lib/templates/**/*.js'] +
                  ["lib/yaarg.rb",
                   "lib/yaarg/version.rb"
                  ]
  s.homepage    = 'https://github.com/foguinhoperuca/yaarg'
  s.license     = 'MIT'
  s.executables << 'yaarg'
end
