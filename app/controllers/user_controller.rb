class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to '/profile'
    else
      flash[:notice] = user.errors.full_messages.to_sentence
      redirect_to '/registration'
    end
  end

  def show
    @posts = current_user.new_posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(update_params)
    if @user.save
      flash[:success] = 'Profile Successfully Updated!'
      redirect_to '/profile'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to '/profile/edit'
    end
  end

  private

  def update_params
    params.permit(:name, :city, :state, :email)
  end

  def user_params
    params.require(:user).permit(:name, :email, :city, :state, :password, :password_confirmation)
  end
end
