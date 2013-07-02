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
  before do
  	@door = FactoryGirl.build :door 
  end

  subject { @door }
  	it { should respond_to(:doorname) }
  	# it { should respond_to(:doorkey_id)}

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
      new_door_key = FactoryGirl.build :door_key
      another_door_key = FactoryGirl.build :door_key
			door.door_keys << new_door_key 
      door.door_keys << another_door_key
      door.door_keys.should == [new_door_key, another_door_key]
		end
	end

	describe "fob should validate door" do
		before do

			@fob    = Fob.create(key: "888ae86f709f8aa375bd425a2040c606")
      @user   = User.create(name: "test user", fobs: [ @fob ], door_keys: [ ])
#      @user   = FactoryGirl.create(:user)
			@door 	= Door.create(doorname: "test door")
      @door = FactoryGirl.create :door
			@door_key = DoorKey.create(user: @user, door: @door)
			@user.door_keys <<  @door_key
			@user.save
		end

		it "should validate fob and door" do
      fob = Fob.find(@fob.id)
      door = Door.find(@door.id)
			@door.validate_fob(fob).should == true
			
		end
	end

end
