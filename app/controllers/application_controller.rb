class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    if session[:user_id]
      redirect_to "/focus"
    end
  end

  def focus
    @user = User.find_by_id(session[:user_id])
    @new_problem = @user.problems.new
    @problems = @user.unsolved_problems.where focus: true
  end

  def all
    @user = User.find_by_id(session[:user_id])
    @new_problem = @user.problems.new
    @problems = @user.unsolved_problems
  end
end
