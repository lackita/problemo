class UsersController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/focused"
    end
  end

  def focused
    @user = User.find_by_id(session[:user_id])
    @new_problem = @user.problems.new
    @new_problem.focused = true
    @problems = @user.unsolved_problems.where focused: true
  end

  def all
    @user = User.find_by_id(session[:user_id])
    @new_problem = @user.problems.new
    @new_problem.focused = false
    @problems = @user.unsolved_problems
  end

  def auth
    uid = request.env['omniauth.auth'][:uid]
    user = User.find_by_google_uid(uid)
    if not user
      user = User.create! google_uid: uid
    end

    session[:user_id] = user.id
    redirect_to "/"
  end

  def sign_out
    reset_session
    redirect_to "/"
  end
end
