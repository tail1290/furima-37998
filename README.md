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
| birth_day          | string | null: false              |

### Association
- has_many :products
- has_many :comments

## productsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| value         | string     | null: false                    |
| product_name  | string     | null: false                    |
| product_text  | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| load          | string     | null: false                    |
| area_ken      | string     | null: false                    |
| date_shipment | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- belongs_to :user
-belongs_to :product

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_ken         | string     | null: false                    |
| area_shi         | string     | null: false                    |
| area_ban         | string     | null: false                    |
| area_build       | string     | null: false                    |
| phone_number     | string     | null: false                    |

## histories

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| load          | string     | null: false                    |
| area_ken      | string     | null: false                    |
| date_shipment | string     | null: false                    |
