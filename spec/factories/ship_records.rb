FactoryBot.define do

  factory :ship_record do
    postal_code {"123-4567"}
    city {"札幌市"}
    address {"青山1-1-1"}
    building {"柳ビル103"}
    phone_number {"09000000000"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    token {"tok_abcdefghijk00000000000000000"}
  end
  
end