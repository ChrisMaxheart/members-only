class SessionsController < ApplicationController

  def new
  end

  def create
    my_user = User.find_by(:username => params[:session][:username])
    if my_user && my_user.authenticate(params[:session][:password])
      flash[:success] = "success!"
      cookies.permanent[:login_token] = my_user.login_token
      redirect_to users_path
    else
      flash.now[:danger] = "failed!"
      render :new
    end
  end

  def destroy
    find_user
    if @user.nil?
      flash[:danger] = "Not signed in"
    else
      cookies.permanent[:login_token] = nil
      flash[:success] = "Signed out"
    end
    redirect_to users_path
  end

end
