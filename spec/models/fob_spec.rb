# == Schema Information
#
# Table name: fobs
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Fob do
  before do
  	@fob = FactoryGirl.build :fob 
  end

  subject { @fob }

  it { should respond_to(:key) }

  it { should be_valid }

  describe "when key is not present" do
  	before { @fob.key = " " }
  	it { should_not be_valid }
  end

  	describe "key is already taken" do
     before do
      fob_with_same_key = @fob.dup
      fob_with_same_key.key = @fob.key
      fob_with_same_key.save
    end

    it { should_not be_valid }
  end

  describe "user association" do
  	it "has a user" do
	  user = FactoryGirl.build :user 
	  fob = FactoryGirl.build :fob, user: user 
  	  fob.user.should == user
  	end
  end
end
