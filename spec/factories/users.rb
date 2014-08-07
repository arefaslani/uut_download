# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    stdudent_number "MyString"
    email "MyString"
    password_digest "MyString"
  end
end
