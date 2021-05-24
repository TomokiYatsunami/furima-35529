FactoryBot.define do
  factory :product do
    product_name {"オムライス"}
    description {"不味くはないが、美味しくもない"}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    ship_price_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    ship_date_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 300, to: 9999999)}

    
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    
  end
end
