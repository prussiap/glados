# == Schema Information
#
# Table name: door_keys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  door_id    :integer
#

require 'spec_helper'

describe DoorKey do
  before do
  	@doorkey = DoorKey.new(user_id: 1 , door_id: 2)
  end

  subject { @doorkey }

  it { should respond_to(:user_id) }
  it { should respond_to(:door_id) }
  it { should be_valid }

  describe "when user_id is not present" do
  	before { @doorkey.user_id = " "}
  	it { should_not be_valid }
  end

  describe "when door_id is not present" do
  	before  { @doorkey.door_id = " "}
  	it { should_not be_valid }
  end


  	describe "relationship to door " do
		it "has a door" do
			mydoor = Door.new
			adoorkey = DoorKey.new(door: mydoor)
			adoorkey.door.should == mydoor
		end
	end

    describe "relationship to user " do
    it "has a user" do
      myuser = User.new
      a_new_door_key = DoorKey.new( user: myuser )
      a_new_door_key.user.should == myuser
    end
  end

end
