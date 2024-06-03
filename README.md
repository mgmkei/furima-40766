
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| prefecture      | string     | null: false |
| delivery_day    | string     | null: false |
| delivery_charge | string     | null: false |
| description     | text       | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| block         | string     | null: false |
| building_name | string     |             |
| item          | references | null: false, foreign_key: true |
| buyer         | references | null: false, foreign_key: true |
| seller        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item