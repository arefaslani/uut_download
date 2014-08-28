module SessionsHelper
  def sign_in(user)
    @user.regenerate_auth_token
    cookies[:auth_token] = @user.auth_token
    self.current_user = user
  end

  def signed_in?
    !self.current_user.nil? 
  end

  def sign_out
    cookies.delete(:auth_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token])
  end

  def check_signed_in
    unless signed_in?
      flash[:warning] = "You should sign in to view this page."
      redirect_to login_path(:redirect_url => request.env['REQUEST_URI'])
    end
  end
end