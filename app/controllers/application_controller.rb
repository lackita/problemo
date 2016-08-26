class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @new_problem = Problem.new
    @problems = Problem.where solved: false
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
  end
end
