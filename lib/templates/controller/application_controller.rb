class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

  before_action :authenticate_user!

  # FIXME not working!! Method undefined...
  before_action :set_paper_trail_whodunnit
end
