class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @problem = Problem.new
  end
end
