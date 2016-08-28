require 'fileutils'

# sudo cp /home/jefferson/universal/projects/yaarg/lib/templates/controller.rb /var/lib/gems/2.3.0/gems/responders-1.1.2/lib/generators/rails/templates/controller.rb; cp -R /home/jefferson/universal/projects/yaarg/lib/templates/erb/ ~/universal/projects/msr/lobby/lib/templates/; cp -R /home/jefferson/universal/projects/yaarg/lib/templates/active_record/ ~/universal/projects/msr/lobby/lib/templates/; bundle exec rake db:rollback STEP=1 RAILS_ENV=development; rails destroy scaffold Contact; rails generate scaffold Contact contact:string obs:text contact_type:references person:references; bundle exec rake db:migrate RAILS_ENV=development

# sudo cp /home/jefferson/universal/projects/yaarg/lib/templates/controller.rb /var/lib/gems/2.3.0/gems/responders-1.1.2/lib/generators/rails/templates/controller.rb

# cp -R /home/jefferson/universal/projects/yaarg/lib/templates/erb/ ~/universal/projects/msr/lobby/lib/templates/

# cp -R /home/jefferson/universal/projects/yaarg/lib/templates/active_record/ ~/universal/projects/msr/lobby/lib/templates/

# bundle exec rake db:rollback STEP=1 RAILS_ENV=development

# rails destroy scaffold AddressType

# rails generate scaffold AddressType label:string

# bundle exec rake db:migrate db:seed RAILS_ENV=development


# # TODO use rails plurilize
# SCAFF = "C:\\universal\\projects\\pms\\scaff\\"
# dbMigrate = "20160706134605_create_load_invoices"
# entity = "load_invoice"
# entities = "load_invoices"

# # invoke  active_record
# FileUtils.mv(SCAFF + "db\\migrate\\" + dbMigrate + ".rb", "db\\migrate\\") # FIXME not working...
# FileUtils.mv(SCAFF + "app\\models\\" + entity + ".rb", "app\\models\\")
# # invoke test_unit
# FileUtils.mv(SCAFF + "test\\models\\" + entity + "_test.rb", "test\\models\\")
# FileUtils.mv(SCAFF + "test\\fixtures\\" + entities + ".yml", "test\\fixtures\\")
# # invoke scaffold_controller
# FileUtils.mv(SCAFF + "app\\controllers\\" + entities + "_controller.rb", "app\\controllers\\")
# # invoke erb
# Dir.mkdir("app\\views\\" + entities) unless File.exists?("app\\views\\" + entities)
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\index.html.erb", "app\\views\\" + entities + "\\")
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\edit.html.erb", "app\\views\\" + entities + "\\")
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\show.html.erb", "app\\views\\" + entities + "\\")
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\new.html.erb", "app\\views\\" + entities + "\\")
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\_form.html.erb", "app\\views\\" + entities + "\\")
# # invoke test_unit
# FileUtils.mv(SCAFF + "test\\controllers\\" + entities + "_controller_test.rb", "test\\controllers\\")
# # invoke helper
# FileUtils.mv(SCAFF + "app\\helpers\\" + entities + "_helper.rb", "app\\helpers\\")
# # invoke jbuilder
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\index.json.jbuilder", "app\\views\\" + entities + "\\")
# FileUtils.mv(SCAFF + "app\\views\\" + entities + "\\show.json.jbuilder", "app\\views\\" + entities + "\\")
# # invoke coffee
# FileUtils.mv(SCAFF + "app\\assets\\javascripts\\" + entities + ".coffee", "assets\\javascripts\\")
# # invoke scss
# FileUtils.mv(SCAFF + "app\\assets\\stylesheets\\" + entities + ".scss", "assets\\stylesheets\\")
