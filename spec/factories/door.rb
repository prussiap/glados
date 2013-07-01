require 'factory_girl'

FactoryGirl.define do
  factory :door do
    sequence(:doorname) {|n| "anotherdoor#{n}"}
#    association :door_key, factory: :door_key
  end
end

