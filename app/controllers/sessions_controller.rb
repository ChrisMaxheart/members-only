class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "success!"
    else
      flash.now[:danger] = "failed!"
    end
    render :new
  end
end
