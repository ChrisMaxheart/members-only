class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "success!"
      cookies.permanent[:login_token] = user.login_token
      redirect_to users_path
    else
      flash.now[:danger] = "failed!"
      render :new
    end
  end

  def find_user
    @user ||= User.find_by(:login_token => cookies.permanent[:login_token])
  end

  def destroy
    current_user = find_user
    if current_user.nil?
      flash[:danger] = "Not signed in"
    else
      cookies.permanent[:login_token] = nil
      flash[:success] = "Signed out"
    end
    redirect_to users_path
  end

end
