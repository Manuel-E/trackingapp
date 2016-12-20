require 'rails_helper'

RSpec.describe Location, type: :model do
  	it "has a valid factory" do
		expect(build(:location)).to be_valid
	end

	it "is not valid with a non numerical latitude" do
  		location=Location.new(latitude:"Abc")
  		expect(location).to be_invalid
 	end

 	it "is not valid with a non numerical longitude" do
  		location=Location.new(longitude:"Abc")
  		expect(location).to be_invalid
 	end
end
