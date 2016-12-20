FactoryGirl.define do
  factory :fleet do
    sequence(:name) {|n| "Fleet #{n}" }

    city_id { FactoryGirl.create(:city).id }

  end
end
