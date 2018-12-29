class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_user
    @user ||= User.find_by(:login_token => cookies.permanent[:login_token])
  end

  def signed_in
    find_user
    if @user.nil?
      flash[:danger] = "You need to login first"
      redirect_to login_path
    end
  end
end
