# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user_id 1
    apartment_id 1
    body "MyText"
    rating 1
  end
end
