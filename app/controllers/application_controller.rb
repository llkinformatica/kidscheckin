class ApplicationController < ActionController::Base
    before_action :authenticate_usuario!
    #protect_from_forgery unless: -> { request.format.json? }
end
