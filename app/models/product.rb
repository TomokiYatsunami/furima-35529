class Product < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status, :ship_price, :ship_date, :category, :prefecture

  with_options presence: true do
    validates :product_name, :description, :price
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id, :ship_price_id, :ship_date_id, :category_id, :prefecture_id
  end

end
