class UsersController < ApplicationController
  def auth
    raise Exception.new(request.env['omniauth.auth'][:uid])
    redirect_to "/"
  end
end
