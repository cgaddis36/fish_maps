require 'securerandom'
class SessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "/"
  end

  def new
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
    else
      flash[:error] = "Incorrect email/password"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Successfully Logged Out"
    redirect_to "/"
  end

  private

  def login(user)
    session[:user_id] = user.id
    flash[:success] = "Welcome to FishMaps, #{user.name}!"
    redirect_to '/'
  end
end
