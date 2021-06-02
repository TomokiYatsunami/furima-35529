require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザーの新規登録ができる時' do
    
      it "全ての項目の入力が存在すれば登録できる" do
        expect(@user).to be_valid
      end
  
    end

    context 'ユーザーの新規登録ができない時' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "passwordが空では登録できない" do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailに「＠」がない場合、登録できない' do
        @user.email ="atmarknashi.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name ="ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name ="ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana ="あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = "aiueoka"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = "ＡＢＣＤＥ１２"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is invalid"
      end
    end
  end
end