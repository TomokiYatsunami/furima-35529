require 'rails_helper'

RSpec.describe ShipRecord, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @ship_record = FactoryBot.build(:ship_record, user_id: @user.id, product_id: @product.id)
    sleep 1 #SQLの処理がspecの処理より遅いときに書く、この場合は1秒作業を遅らせれる。
  end

  describe '商品購入機能' do
    context '商品の購入ができる時' do
      
      it "クレジットカードのtoken及び全ての項目の入力が存在すれば登録できる" do
        expect(@ship_record).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @ship_record.building = ''
        expect(@ship_record).to be_valid
      end

    end

    context '商品の購入ができない時' do

      it 'postal_codeが空では登録できない' do
        @ship_record.postal_code = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'prefecture_idが1では登録できない' do
        @product.prefecture_id = 1  
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'cityが空では登録できない' do
        @ship_record.city = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "City can't be blank"
      end

      it 'addressが空では登録できない' do
        @ship_record.address = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空では登録できない' do
        @ship_record.phone_number = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "Phone number can't be blank"
      end
      
      it '郵便番号にハイフンが無いと保存不可能であること' do
        @ship_record.postal_code = "8987654"
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "Postal code is invalid"
      end

      it '電話番号は12桁以上の数は保存不可能なこと' do
        @ship_record.phone_number = "012345678910"
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include "Phone number is invalid"
      end

      it "tokenが空では登録できないこと" do
        @ship_record.token = nil
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end