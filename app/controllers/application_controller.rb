class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @new_problem = @user.problems.new
      @new_hypothesis = Hypothesis.new
    end
  end
end
