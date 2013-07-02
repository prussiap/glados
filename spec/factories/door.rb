require 'factory_girl'

FactoryGirl.define do
  factory :door do
    sequence(:doorname) {|n| "anotherdoor#{n}"}
  end
end

