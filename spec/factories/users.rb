# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password 'secret'

    factory :john do
      email 'tester2@gmail.com'
      name 'John'
    end

    factory :sarah do
      email 'tester1@gmail.com'
      name 'Sarah'
    end
  end
end
