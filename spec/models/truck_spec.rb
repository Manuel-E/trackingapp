require 'rails_helper'

RSpec.describe Truck, type: :model do
  	it "has a valid factory" do
		expect(build(:truck)).to be_valid
	end

	it "is not valid without a name" do
  		truck=Truck.new(name:nil,fleet:FactoryGirl.create(:fleet))
  		expect(truck).to be_invalid
 	end

 	it "is not valid with an empty name" do
  		truck=Truck.new(name:"",fleet:FactoryGirl.create(:fleet))
  		expect(truck).to be_invalid
 	end

	it "is not valid without a fleet" do
  		truck=Truck.new(name:"abc")
  		expect(truck).to be_invalid
 	end

end
