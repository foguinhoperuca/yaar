# YAARG

Yet Another AdminLTE Ruby Gem - 'cause all others is outdated...

# Paths

## _controller_

lib/templates/rails/scaffold_controller/controller.rb

## _responder controller_

lib/templates/rails/responders_controller/controller.rb

## _view_

lib/templates/erb/scaffold/<ACTION>.html.erb

## _model_

lib/templates/active_record/model/model.rb

# What do you need to install theme?

* Copy controller template;
* Copy model template;
* Copy view templates: _form, index.[html|jbuilder], show.jbuilder
* Copy application_helper.rb

## Config

* Setup default_locale
* Setup WillPaginate.per_page
* Copy locale file: devise; pt-BR; will_paginate.pt-BR;
* Configure vendor directory
** javascript: bootstrap.js; app.js; select2.js, etc.
** stylesheet: AdminLTE.css; bootstrap; skins/;

## App

* 

### Rails Asset ###

* use [rails-assets](https://rails-assets.org "Integrate buncler and bower"):
** [admin-lte](https://github.com/almasaeed2010/AdminLTE "AdminLTE -- is a fully responsive admin template")
** [jquery-slimscroll](https://github.com/rochal/jQuery-slimScroll "slimScroll is a small jQuery plugin that transforms any div into a scrollable area with a nice scrollbar")
** [fastclick](https://github.com/ftlabs/fastclick "FastClick is a simple, easy-to-use library for eliminating the 300ms delay between a physical tap and the firing of a click event on mobile browsers.")
* Configure config/initializers/assets.rb for plugins installed
* Add public/css/_all-skins.min.css;

**Profit!!!**
