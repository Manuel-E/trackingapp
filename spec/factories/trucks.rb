FactoryGirl.define do
  factory :truck do
    sequence(:name) {|n| "Truck #{n}" }
    fleet_id { FactoryGirl.create(:fleet).id }

  end
end
