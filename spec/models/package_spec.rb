require 'rails_helper'

RSpec.describe Package, type: :model do

	it "has a valid factory" do
		expect(build(:package)).to be_valid
	end

 	it "is not valid without a content" do
  		package=Package.new(weight:"15.0",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
 	end

 	it "is not valid without a weigth" do
  		package=Package.new(content:"content",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
 	end

 	it "is not valid with a non numerical weigth" do
  		package=Package.new(content:"content",weight:"abc",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
 	end

  	it "is not valid without a current_location" do
  		package=Package.new(content:"content",weight:"15.0",origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
  	end

  	it "is not valid without a origin" do
  		package=Package.new(content:"content",weight:"15.0",current_location:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
  	end

  	it "is not valid without a destination" do
  		package=Package.new(content:"content",weight:"15.0",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),state:FactoryGirl.create(:state),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
  	end

  	it "is not valid without a state" do
  		package=Package.new(content:"content",weight:"15.0",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),truck:FactoryGirl.create(:truck))
  		expect(package).to be_invalid
  	end

  	it "is not valid without a truck" do
  		package=Package.new(content:"content",weight:"15.0",current_location:FactoryGirl.create(:location),origin:FactoryGirl.create(:location),destination:FactoryGirl.create(:location),state:FactoryGirl.create(:state))
  		expect(package).to be_invalid
  	end

end
