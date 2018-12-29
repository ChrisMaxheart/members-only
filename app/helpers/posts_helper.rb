module PostsHelper

  def find_user
    @user ||= User.find_by(:login_token => cookies.permanent[:login_token])
  end

end
