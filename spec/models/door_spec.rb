# == Schema Information
#
# Table name: doors
#
#  id         :integer          not null, primary key
#  doorkey_id :integer
#  doorname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Door do
  subject { FactoryGirl.build(:door) }
  	it { should respond_to(:doorname) }
    it { should be_valid}

	describe "when door is already taken" do
		it "should not be duplicated" do
			matching_door_name = "existing_name"
      ndoor = FactoryGirl.create(:door, doorname: matching_door_name)
      door_with_same_name = FactoryGirl.build(:door, doorname: matching_door_name )
			door_with_same_name.should_not be_valid
		end
	end

	describe "has keys " do
		it "will add a doorkey" do
		  door = FactoryGirl.create :door
      new_door_key = FactoryGirl.create(:door_key, door: door)
      door.door_keys.should == [ new_door_key ]
		end
	end

	describe "should validate" do
    it "should validate door and fob" do
      user    = FactoryGirl.create(:user)
      fob     = FactoryGirl.create :fob, user: user
      door_key = FactoryGirl.create(:door_key, user: user)
      door    = door_key.door
      door.validate_fob(fob).should == true
    end

	end
end
