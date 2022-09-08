FactoryBot.define do
  factory :product do
    association :user

    image              {Faker::Lorem.sentence}
    product_name       {Faker::Name.initials(number: 2)}
    product_text       {Faker::Lorem.sentence}
    value              {10000}
    condition_id       {2}
    area_ken_id        {2}
    load_id            {2}
    date_shipment_id   {2}
    category_id        {2}
    
  end
end
