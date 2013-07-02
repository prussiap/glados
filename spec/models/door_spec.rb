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

	describe "fob should validate door" do
		before do

      fob     = FactoryGirl.create :fob
      door_key = FactoryGirl.create(:door_key, user: user)
      user    = FactoryGirl.create(:user, fobs: [ fob ])
#			@fob    = Fob.create(key: "888ae86f709f8aa375bd425a2040c606")
#      @user   = User.create(name: "test user", fobs: [ @fob ], door_keys: [ ])
#      @user   = FactoryGirl.create(:user)
#			@door 	= Door.create(doorname: "test door")
      
#			@door_key = DoorKey.create(user: @user, door: @door)
      door_key = FactoryGirl.create(:door_key, user: @user)
#      @door = FactoryGirl.create(:door, door_keys: [ @door_key ] )
			user.door_keys <<  @door_key
			@user.save
		end

		it "should validate fob and door" do
      fob = Fob.find(@fob.id)
      door = Door.find(@door.id)
			@door.validate_fob(fob).should == true
			
		end
	end
 
end
