require 'factory_girl'

FactoryGirl.define do
  factory :door_key do
    association :door, strategy: :build
    association :user
  end
end
