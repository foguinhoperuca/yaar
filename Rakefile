require 'rake/testtask'
require 'yaarg'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
# task :default => :test
task :default => :manual

task :manual do
  Rake::Task["build"].invoke
  Rake::Task["deploy:local"].invoke
  puts "running the gem..."
  puts "version: #{Yaarg.ver}"
  system("yaarg")
end

task :build do
  puts "building the gem..."
  system("gem build yaarg.gemspec")
end

namespace :deploy do
  task :local do
    puts "installing the gem..."
    system("sudo gem install yaarg-#{Yaarg.ver}.gem")
  end
end
