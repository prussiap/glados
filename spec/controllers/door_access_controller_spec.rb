require 'spec_helper'

describe DoorAccessController do
	describe "GET listings" do
		get :checkdooraccess
		response.should be_success
	end



	describe "should populate door field" do
		it "populates an array of doors"
		it "renders the :index view"
		assigns(:door).should_not be_nil
	end
	
	describe "should populate fob field" do
		it "populates an array of fobs"
		it "renders the :index view"
		assigns(:fob).should_not be_nil
	end



	describe "Post both dropdowns check if fob is valid" do
		context " with valid door access credientials" do
		it "submits fob and door"
		it "renders the :success view"
		end

		context "with invalid door access credentials" do
		it "submits fob and door"
		it "renders denied flash"
		end
	end

end
