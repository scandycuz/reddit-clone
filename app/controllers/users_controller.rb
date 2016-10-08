class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid Info"]
      render :new
    end
  end

  def show
    render homepage
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
