class UsersController < ApplicationController
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
