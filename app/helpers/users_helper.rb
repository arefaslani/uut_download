module UsersHelper
  def regenerate_auth_token
    self.update_attribute(:auth_token, generate_token)
  end

  private

  def generate_token
    string = self.email.to_s + Time.now.to_s + ApplicationHelper.secret_key.to_s
    Digest::MD5.hexdigest(string)
  end
end