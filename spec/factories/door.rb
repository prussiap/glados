require 'factory_girl'

FactoryGirl.define do
  factory :door do
    sequence(:doorname, 100000) {|n| "anotherdoor#{n}"}
  end
end

