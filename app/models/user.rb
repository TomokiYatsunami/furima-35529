class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
    validates :first_name, :last_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana, :last_name_kana
  end
  
  validates :password,        format: {with: /\A[a-zA-Z0-9]+\z/}
end
