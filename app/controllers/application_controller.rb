class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @new_problem = Problem.new
    @problems = Problem.where solved: false
  end
end
