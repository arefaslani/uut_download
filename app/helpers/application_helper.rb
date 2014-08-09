module ApplicationHelper
  def self.secret_key
    YAML.load(File.open("#{Rails.root}/config/secrets.yml"))[Rails.env]['secret_key_base']
  end
end
