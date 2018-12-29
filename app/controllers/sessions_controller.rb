class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "success!"
      cookies.permanent[:login_token] = user.login_token
      render :new
    else
      flash.now[:danger] = "failed!"
      render :new
    end
  end
end
