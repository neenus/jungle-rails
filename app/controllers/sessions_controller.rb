class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(session_params[:email])
      # if user exists and password entered correctly
    if user && user.authenticate(session_params[:password])
      #save the user id inside the browser cookie. this is how we keep
      # the user logged in when they navigate around the app
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if user's login doesn't work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(
      :email, :password
    )
  end

end
