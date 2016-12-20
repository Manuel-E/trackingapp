FactoryGirl.define do
  factory :location do
    latitude 1.5
    longitude 1.5
    sequence(:address) {|n| "address #{n}" }
  end
end
