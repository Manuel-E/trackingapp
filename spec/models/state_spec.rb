require 'rails_helper'

RSpec.describe State, type: :model do
  	it "has a valid factory" do
		expect(build(:state)).to be_valid
	end

	it "is not valid without a name" do
  		state=State.new(name:nil,)
  		expect(state).to be_invalid
 	end

 	it "is not valid with an empty name" do
  		state=State.new(name:"")
  		expect(state).to be_invalid
 	end

 	it "is not valid with a taken name" do
 		state=FactoryGirl.create(:state)
  		state=State.new(name:state.name)
  		expect(state).to be_invalid
 	end
end
