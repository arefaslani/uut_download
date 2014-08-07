# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    student_number "8821221222"
    email "testuser@test.com"
    password_digest "simplepassword"
  end
end
