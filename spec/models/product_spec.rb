require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '商品の出品ができる時' do
    
      it "全ての項目の入力が存在すれば出品できる" do
        expect(@product).to be_valid
      end
  
    end

    context '商品の出品ができない時' do

      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end

      it 'product_nameが空では出品できない' do
        @product.product_name = ''  
        @product.valid?
        expect(@product.errors.full_messages).to include "Product name can't be blank"
      end

      it "descriptionが空では出品できない" do
        @product.description = ''  
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end

      it "category_idが1では出品できない" do
        @product.category_id = '1'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Category must be other than 1"
      end

      it "status_idが1では出品できない" do
        @product.status_id = '1'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Status must be other than 1"
      end

      it "ship_price_idが1では出品できない" do
        @product.ship_price_id = '1'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Ship price must be other than 1"
      end

      it "prefecture_idが1では出品できない" do
        @product.prefecture_id = '1'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it "ship_date_idが1では出品できない" do
        @product.ship_date_id = '1'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Ship date must be other than 1"
      end

      it "priceが空では出品できない" do
        @product.price = ''  
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end

      it "priceが300より下では出品できない" do
        @product.price = '299'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it "priceが9999999より上では出品できない" do
        @product.price = '10000000'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it "priceが全角数字だと出品できない" do
        @product.price = '２０００'  
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
