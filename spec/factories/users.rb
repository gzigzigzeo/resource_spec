FactoryGirl.define do
  factory :user do
    first_name { FFaker::Lorem.name }
    last_name { FFaker::Lorem.name }
  end
end
