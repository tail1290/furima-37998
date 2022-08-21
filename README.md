# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| name_kanji_sei     | string | null: false              |
| name_kana_sei      | string | null: false              |
| name_kanji_mei     | string | null: false              |
| name_kana_mei      | string | null: false              |
| birth_day          | data   | null: false              |

### Association
- has_many :products
- has_many :comments
- has_many :histories

## productsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| value            | integer    | null: false                    |
| product_name     | string     | null: false                    |
| product_text     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| load_id          | integer    | null: false                    |
| area_ken_id      | integer    | null: false                    |
| date_shipment_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- belongs_to :histories

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_ken_id      | integer    | null: false                    |
| area_shi         | string     | null: false                    |
| area_ban         | string     | null: false                    |
| area_build       | string     |                                |
| phone_number     | string     | null: false                    |
| history          | references | null: false,foreign_key: true  |

### Association
- belongs_to :histories

## histories

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address