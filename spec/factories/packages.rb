FactoryGirl.define do


 	factory :package do
 		tracking_id "abc123"
    	weight 1.5
    	content "MyString"
  		current_location_id { FactoryGirl.create(:location).id }
  		origin_id { FactoryGirl.create(:location).id }
  		destination_id { FactoryGirl.create(:location).id }
  		state_id { FactoryGirl.create(:state).id }
  		truck_id { FactoryGirl.create(:truck).id }
  end


 	factory :package_for_attributes, :class =>"Package" do
 		tracking_id "abc123"
    	weight 1.5
    	content "MyString"
  		current_location_attributes { FactoryGirl.attributes_for(:location) }
  		origin_attributes{ FactoryGirl.attributes_for(:location) }
  		destination_attributes { FactoryGirl.attributes_for(:location) }
  		state_id { FactoryGirl.create(:state).id }
  		truck_id { FactoryGirl.create(:truck).id }
  end


end
