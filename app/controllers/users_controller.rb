class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    #debugger
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user  # logging in user right after signing up
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # this works because Rails automatically infers from redirect_to @user that we want to redirect to user_url(@user).
      #redirect_to user_url(@user)  #this is the original expression
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
