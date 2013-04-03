class ApplicationController < ActionController::Base
  include CasAuthentication
  before_filter :login_required
  protect_from_forgery
end
