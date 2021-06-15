# README
アプリケーション名

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | unique:true, null: false |
| encrypted_password | string | null: false              |

### Association

- has_many :posts
- has_many :messages



## posts テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| sentence    | string     | null: false       |
| room_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :users
- has_many   :post_tags
- has_many   :tags,through: :post_tags
- has_many   :message



## post_tag_relations テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_id | references | null: false, foreign_key: true |
| tag_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag



## tags テーブル

| Column     | Type | Options     |
| ---------- | ---- | ----------- |
| tag_name   | text | null: false |

### Association

- has_many :posts, through: :post_tags



## message テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     |                                |
| post     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user