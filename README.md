## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Associationテーブル

has_many :products dependent: :destroy
has_many :shipping_information dependent: :destroy
has_many :purchase_records dependent: :destroy

## Products

| Column       | Type    | Options                       |
| ------------ | ------- | ----------------------------- |
| product_name | string  | null: false                   |
| description  | text    | null: false                   |
| category     | string  | null: false                   |
| status       | text    | null: false                   |
| ship_price   | string  | null: false                   |
| ship_from    | string  | null: false                   |
| ship_date    | string  | null: false                   |
| price        | integer | null: false                   |
| user_id      | integer | null: false, foreign_key:true |

### Association

belongs to :user
has_one :purchase_record

## Shipping_Informationテーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| postal_code        | string  | null: false                   |
| prefecture         | string  | null: false                   |
| city               | string  | null: false                   |
| address            | string  | null: false                   |
| building           | string  |                               |
| phone_number       | string  | null: false                   |
| purchase_record_id | integer | null: false, foreign_key:true |
### Association

belongs to :user
belongs_to :purchase_record

## Purchase_Recordsテーブル

| Column       | Type    | Options                       |
| ------------ | ------- | ----------------------------- |
| user_id      | integer | null: false, foreign_key:true |
| product_id   | integer | null: false, foreign_key:true |

### Association

belongs to :user
has_one :shipping_information
belongs_to :product