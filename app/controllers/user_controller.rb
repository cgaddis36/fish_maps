class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/profile"
    else
      flash[:notice] = user.errors.full_messages.to_sentence
      redirect_to "/registration"
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :city, :state, :bio, :password)
  end
end
