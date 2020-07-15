class User::PasswordController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if params[:password] == params[:password_confirmation]
        current_user.update(password: params[:password])
        redirect_to "/profile"
        flash[:notice] = "Password Successfully Updated!"
    else
        redirect_to "/password"
        flash[:error] = "Passwords do not match, try another combination."
    end
  end

end
