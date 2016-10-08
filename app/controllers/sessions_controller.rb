class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      user.reset_session_token
      session[:session_token] = user.session_token
      redirect_to subs_url
    else
      flash[:errors] = ["No user found."]
      render :new
    end
  end

  def destroy
    logout!(current_user)
    render :new
  end

  def new
    # redirect_to :new
  end

  private
  def session_params
    params.require(:session).permit(:username, :password, :session_token)
  end
end
