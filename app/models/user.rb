class User < ActiveRecord::Base
  has_secure_password

  # student_number is 10 digits
  validates :student_number,
    length: { is: 10 },
    format: { with: /\A\d{10}\z/ },
    presence: true

  validates :email,
    format: { with: /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/ },
    presence: true
end
