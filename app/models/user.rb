require 'utils/user'

class User < ActiveRecord::Base
  include Utils::User
  has_secure_password

  has_many :links

  # student_number is 10 digits
  validates :student_number,
    length: { is: 10 },
    format: { with: /\A\d{10}\z/ },
    presence: true,
    uniqueness: true

  validates :email,
    format: { with: /\A([a-z0-9_\.-]+)@[\da-z\.-]+\z/i },
    presence: true,
    uniqueness: true
end
