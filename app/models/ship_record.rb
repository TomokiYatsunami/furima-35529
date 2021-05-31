class ShipRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :record_id, :user_id, :product_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, :address, :user_id, :product_id, :token
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  
  def save
    record = Record.create(user_id: user_id, product_id: product_id)
    Ship.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, record_id: record.id)
  end
end
