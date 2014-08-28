# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    type "http"
    address "http://www.google.com"
  end
end
