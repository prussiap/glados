require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "anothername#{n}"}
  end
end
