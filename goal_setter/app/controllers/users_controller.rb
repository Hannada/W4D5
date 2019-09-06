class UsersController < ApplicationController 
  def new
    render :new 
  end

  def create 
    @user = User.new(strong_params)
    if @user.save
      debugger
      login!(@user)
      debugger
      #render session show 
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new 
    end
  end 


  def strong_params
    params.require(:user).permit(:username, :password)
  end 




end