class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session["message"] = "you signed up!"
    if @user.save
      session["current_user_id"] = @user.id
      redirect_to links_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
