class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status, :ship_price, :ship_date, :category, :prefecture

  with_options presence: true do
    validates :product_name, :description, :price, :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id, :ship_price_id, :ship_date_id, :category_id, :prefecture_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }

end
