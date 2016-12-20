require 'rails_helper'

RSpec.describe City, type: :model do
  	it "has a valid factory" do
		expect(build(:city)).to be_valid
	end

	it "is not valid without a name" do
  		city=City.new(name:nil)
  		expect(city).to be_invalid
 	end
 	it "is not valid with an empty name" do
  		city=City.new(name:"")
  		expect(city).to be_invalid
 	end
end
