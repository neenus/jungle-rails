class UsersController < ApplicationController
# before_filter :authorize

  def new
    
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      flash[:error] = 'An error occured please try again'
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
