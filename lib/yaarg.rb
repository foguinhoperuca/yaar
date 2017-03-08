require 'fileutils'
require "yaarg/version"

module Yaarg
  # Main class
  # class Yaarg

  # Return help instructions.
  def self.help
    # TODO implement usage instruction for all modules
    "============================================================================================================" +
      "============================================================================================================" +
      "|| Copyright (C) 2016 - 2017 - GPLv3 - Jefferson Campos - foguinho [dot] peruca [at] gmail [dot] com      ||" +
      "|| Yet Another AdminLTE Ruby Gem!                                                                         ||" +
      "|| The gem has many modules:                                                                              ||" +
      "|| * tpl: help to manage templates to rails app.                                                          ||" +
      "|| * adminlte: manage adminlte.                                                                           ||" +
      "============================================================================================================" +
      "============================================================================================================" +
      "" +
      "tpl" +
      "===" +
      "" +
      "USAGE: printer_outsourcing [verifySONumber|parsePhysicalSite|parseDepartment|parsePrinterType|generateSeedSO]" +
      "* verifySONumber    : Report if a SO number is in so_audit.csv" +
      "* parsePhysicalSite : Merge data from physicalSite.csv with so_audit.csv" +
      "* parseDepartment   : Merge data from so_with_physicalSite_parsed.csv with department.csv" +
      "* parsePrinterType  : Merge data from so_with_physicalSite-department_parsed.csv with printerType.csv" +
      "* generateSeedSO    : Generate seed data to ../data/redmine_issues.csv" +
      "" +
      "WORKFLOW:" +
      "# Generate missing SO numbers:" +
      "../data/parse_so/audited_so.csv --> ../data/parse_soso_missing.csv" +
      "Unified Printer Registration module" +
      "==================================="
  end

  def self.ver
    VERSION
  end

  def self.tpl(project_path)
    tpl_model(project_path)
    tpl_view(project_path)
    tpl_controller(project_path)
  end
  
  def self.tpl_model(project_path)
    path = project_path + "lib/templates/active_record/model/"
    # FileUtils.mkdir(path) unless Dir.exist? path
    FileUtils.cp("../lib/templates/active_record/model/model.rb", path)
  end

  def self.tpl_view(project_path)
    path = project_path + "lib/templates/erb/scaffold"
    # FileUtils.mkdir(path) unless Dir.exist? path
    FileUtils.cp("../lib/templates/erb/scaffold/index.html.erb", path)
    FileUtils.cp("../lib/templates/erb/scaffold/_form.html.erb", path)
  end

  def self.tpl_controller(project_path)
    path = project_path + "lib/templates/rails/scaffold_controller/"
    # FileUtils.mkdir(path) unless Dir.exist? path
    FileUtils.cp("../lib/templates/rails/scaffold_controller/controller.rb", path)
  end
  
  # end
end
