module SessionsHelper
  def sign_in(user)
    @user.regenerate_auth_token
    cookies[:auth_token] = @user.auth_token
  end
end