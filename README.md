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

has_many :products
has_many :records

## Products

| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| product_name  | string  | null: false                   |
| description   | text    | null: false                   |
| status_id     | integer | null: false                   |
| ship_price_id | integer | null: false                   |
| ship_date_id  | integer | null: false                   |
| price         | integer | null: false                   |
| user_id       | integer | null: false, foreign_key:true |
| category_id   | integer | null: false                   |
| prefecture_id | integer | null: false                   |

### Association

belongs to :user
has_one :record
belongs_to_active_hash :prefecture
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :ship_date
belongs_to_active_hash :ship_price

## Shipsテーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| postal_code        | string  | null: false                   |
| city               | string  | null: false                   |
| address            | string  | null: false                   |
| building           | string  |                               |
| phone_number       | string  | null: false                   |
| record_id          | integer | null: false, foreign_key:true |
| prefecture_id      | integer | null: false                   |

### Association

belongs_to :record
belongs_to_active_hash :prefecture

## Recordsテーブル

| Column       | Type    | Options                       |
| ------------ | ------- | ----------------------------- |
| user_id      | integer | null: false, foreign_key:true |
| product_id   | integer | null: false, foreign_key:true |

### Association

belongs to :user
has_one :ship
belongs_to :product