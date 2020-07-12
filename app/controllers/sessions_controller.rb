class SessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "/"
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/"
  end
end
