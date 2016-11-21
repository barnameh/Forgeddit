class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user && @user.password == params[:password]
      # Does the logging in
      session["current_user_id"] = @user.id

      redirect_to links_path
    else
      @message = "User Name Does Not Exist! Try again or Sign Up"
      render :new
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to links_path
  end
end
