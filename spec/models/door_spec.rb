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
  	@door = Door.new( doorname: "Garage Door")
  end

  subject { @door }
  	it { should respond_to(:doorname) }
  	# it { should respond_to(:doorkey_id)}

 	it { should be_valid}
  	
	describe "when door is already taken" do
		it "should not be duplicated" do
			matching_door_name = "existing_name"
			ndoor = Door.create( doorname: matching_door_name )
			door_with_same_name = Door.new( doorname: matching_door_name )
			door_with_same_name.should_not be_valid
		end
	end 

	describe "has keys " do
		
		it "will add a doorkey" do 
			mydoorkeys = [ DoorKey.new ]
			adoor = Door.new( doorname: "front door", door_keys: mydoorkeys)
			newdoorkey = DoorKey.new
			adoor.door_keys << newdoorkey
			adoor.door_keys.should == mydoorkeys + [ newdoorkey ]
		end
		
	end

end
