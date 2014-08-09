module SessionsHelper
  def sign_in(user)
    @user.regenerate_auth_token
    cookies[:auth_token] = @user.auth_token
  end

  def signed_in?
    User.find_by(auth_token: cookies[:auth_token].to_s)
  end

  def sign_out
    cookies.delete(:auth_token)
  end
end