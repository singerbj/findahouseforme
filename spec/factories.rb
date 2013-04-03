FactoryGirl.define do
  factory :house do
    bathrooms   1
    bedrooms    4
    city        "Eau Claire"
    cost        270
    housenum    "815"
    state       "Wisconsin"
    street      "Chippewa"
    tenants     4
    utilities   30
    zip         54703
  end
end
