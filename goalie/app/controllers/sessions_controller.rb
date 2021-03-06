class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Invalid username or password!']
      render :new
    end 
  end

  def destroy
    logout(current_user)
  end

end
