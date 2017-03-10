require 'rake/testtask'
require 'yaarg'
require 'os'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
# task :default => :test
task :default => :manual

task :manual do
  puts "YAARG VERSION: #{Yaarg.ver}"
  Rake::Task["build"].invoke
  Rake::Task["deploy:local"].invoke
  Rake::Task["scaff"].invoke
end

task :install do
  Rake::Task["build"].invoke
  Rake::Task["deploy:local"].invoke
end

task :build do
  p "-------------------------------------------------------"
  puts "building the gem..."
  p "-------------------------------------------------------"
  system("gem build yaarg.gemspec")
end

namespace :deploy do
  task :local do
    p "-------------------------------------------------------"
    puts "local deploy..."
    p "-------------------------------------------------------"
    cmd = (OS.windows?) ? "gem install yaarg-#{Yaarg.ver}.gem --no-rdoc --no-ri" : "sudo gem install yaarg-#{Yaarg.ver}.gem --no-rdoc --no-ri"
    system(cmd)
  end
end

task :scaff do
  p "-------------------------------------------------------"
  puts "Testing manual... scaff app"
  p "-------------------------------------------------------"
  # system("head /c/Ruby23-x64/lib/ruby/gems/2.3.0/gems/yaarg-0.0.2/lib/templates/erb/scaffold/_form.html.erb")
  # system("yaarg tpl all #{scaff_path}")
  # p "____________________________________________________________________________________"
  # system("head #{scaff_path}/lib/templates/erb/scaffold/_form.html.erb")
  # p "____________________________________________________________________________________"
  
  scaff_path = (OS.windows?) ? "c:\\universal\\projects\\scaff" : "~/universal/projects/scaff"
  Dir.chdir(scaff_path) do
    unless Dir.exists?(scaff_path + "/app/views/products") then
      system("rails destroy scaffold Product")
      system("bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=development")
    end
    system("rails generate scaffold Product name:string obs:text price:decimal{10.2} out_of_stock:boolean -f")
    # system("rails server Puma -e development -b 0.0.0.0 -p 80")
  end
end
