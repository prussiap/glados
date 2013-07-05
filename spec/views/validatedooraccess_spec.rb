require 'spec_helper'

describe "validatedooraccess" do
  let!(:door) { FactoryGirl.create :door }
  let!(:fob) { FactoryGirl.create :fob }
    before { visit dooraccess_path }

  it "should have door field" do
    select door.doorname :from => "door[door_id]"
  end
end
