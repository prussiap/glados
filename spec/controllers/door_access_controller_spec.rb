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
	describe "fob and door" do
    it "should validate_fob" do
			@fob = Fob.create(key: "888ae86f709f8aa375bd425a2040c606")
			@user = User.create(name: "test user", fobs: [@fob])
			@door 	= Door.create(doorname: "test door")
			@door_key = DoorKey.create(user: @user, door: @door)
      @door.validate_fob(@fob).should be_true

		end
	end
end
