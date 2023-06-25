require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_action :verify_requested_format!
  before_action :authenticate_user!, only: %i[new create update destroy]
end
