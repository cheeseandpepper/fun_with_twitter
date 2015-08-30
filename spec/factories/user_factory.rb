FactoryGirl.define do
  factory :user do
    password              "password123"
    password_confirmation "password123"
    email                 "mike@mike.com"
  end
end
