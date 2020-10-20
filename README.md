
#テーブル設計

## users　テーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| email           | string | null: false | 
| password        | string | null: false | 
| nickname        | string | null: false | 
| first_name      | string | null: false | 
| last_name       | string | null: false | 
| first_name_kana | string | null: false | 
| last_name_kana  | string | null: false |
| birth_date      |  date  | null: false |


### Association
 - has_many :items
 - has_many :purchases

## items　テーブル

| Column           | Type       | Options                       | 
| ---------------- | ---------- | ----------------------------- | 
| comment          | text      | null: false                    | 
| category_id      | integer   | null: false                    | 
| condition_id     | integer   | null: false                    | 
| name             | string    | null: false                    |
| charge_id        | integer   | null: false                    | 
| area_id          | integer   | null: false                    | 
| delivery_date_id | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | references| null: false, foreign_key: true |

### Association
 - has_one :purchase
 - belongs_to :user

## purchases　テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| user   | references | null: false, foreign_key: true | 
| item   | references | null: false, foreign_key: true | 

### Association
  - belongs_to :user
  - belongs_to :item
  - has_one :address

## address テーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| post_code     | string     | null: false                    |  
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_num     | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_num     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
  - belongs_to :purchase