require 'rails_helper'

RSpec.describe Fleet, type: :model do
  	it "has a valid factory" do
		expect(build(:fleet)).to be_valid
	end

	it "is not valid without a name" do
  		fleet=Fleet.new(name:nil,city:FactoryGirl.create(:city))
  		expect(fleet).to be_invalid
 	end

 	it "is not valid with an empty name" do
  		fleet=Fleet.new(name:"",city:FactoryGirl.create(:city))
  		expect(fleet).to be_invalid
 	end

	it "is not valid without a city" do
  		fleet=Fleet.new(name:"abc")
  		expect(fleet).to be_invalid
 	end

 	it "is not valid with a taken city" do
 		fleet=FactoryGirl.create(:fleet)
  		fleet=Fleet.new(name:"abc",city:fleet.city)
  		expect(fleet).to be_invalid
 	end
end
