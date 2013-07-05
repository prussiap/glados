require 'spec_helper'

describe DoorAccessController do

	describe "listings" do
		it "should open get validatedooraccess" do
			get :validatedooraccess
			response.should be_success
		end
	end

	describe "should populate door field" do

		it "renders the :index view" do
			get :validatedooraccess
			assigns(:doors).should_not be_nil
		end
	end

	describe "should populate fob field" do
		it "renders the :index view" do
			get :validatedooraccess
			assigns(:fobs).should_not be_nil
		end
	end


	describe "should validate" do
    it "should validate door and fob" do
      user    = FactoryGirl.create(:user)
      fob     = FactoryGirl.create :fob, user: user
      door_key = FactoryGirl.create(:door_key, user: user)
      door    = door_key.door

      get :validatedooraccess, :fob => {:fob_id => fob.id}, :door => {:door_id => door.id}
      door.validate_fob(fob).should == true
    end
	end
end
