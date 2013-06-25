# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do 
	
	before do
		@user = User.new(name: "example 1")
	end

	subject { @user }

	it { should respond_to(:name) }


	it { should be_valid }


  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end



  describe "when name is too long " do
  	before { @user.name = "a" * 51}
  	it { should_not be_valid}
  end


  describe "has fobs" do
    it "will take a fob" do
      myfobs = [ Fob.new ]
      user = User.new(fobs: myfobs)
      user.fobs.should == myfobs  
    end

    it "will take many fobs" do 
      myfobs = [Fob.new, Fob.new]
      user = User.new(fobs: myfobs)
        user.fobs.should == myfobs 
    end

    it "will add a fob" do
      myfobs = [Fob.new]
      user = User.new(fobs: myfobs)
      newfob = Fob.new
      user.fobs << newfob
      user.fobs.should == myfobs + [ newfob ]
    end
  end
  
  describe "has door_keys" do
    it "will take a door_key" do
      my_door_key = [ DoorKey.new ]
      user = User.new(door_keys: my_door_key)
      user.door_keys.should == my_door_key
    end

    it "will take many door_keys" do
      my_door_key = [ DoorKey.new, DoorKey.new ]
      user = User.new(door_keys: my_door_key)
      user.door_keys.should == my_door_key
  end

    it "will add a door_key" do
      my_door_key = [ DoorKey.new ]
      user = User.new(door_keys: my_door_key)
      new_door_key = DoorKey.new
      user.door_keys << new_door_key
      user.door_keys.should == my_door_key + [ new_door_key ]
    end
  end


end
