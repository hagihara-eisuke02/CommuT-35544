# README
アプリケーション名

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |  <!--ユーザー登録 -->
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | unique:true, null: false |
| encrypted_password | string | null: false              |

### Association

- has_many :user_posts
- has_many :posts,through: :user_posts
- has_many :messages



## user_posts テーブル

| Column  | Type       | Options                        |  <!--ユーザー登録と掲示板の中間テーブル -->
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post



## posts テーブル

| Column      | Type       | Options           |  <!-- 掲示板投稿 -->
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| tag         | string     | null: false       |
| message     | text       | null: false       |
| room_id     | references | foreign_key: true |
| user        | references | foreign_key: true |
| create_date | datetime   | null: false       |

### Association

- has_many :user_posts
- has_many :post_tags
- has_many   :users, through: :user_posts
- has_many   :tags,through: :post_tags
- has_one    :room



## post_tags テーブル

| Column  | Type       | Options                        |<!-- 掲示板投稿とタグの中間テーブル -->
| ------- | ---------- | ------------------------------ |
| post_id | references | null: false, foreign_key: true |
| tag_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag



## tags テーブル

| Column | Type | Options     |  <!-- タグ機能 -->
| ------ | ---- | ----------- |
| name   | text | null: false |

### Association

- has_many :posts, through: :post_tags



## rooms テーブル

| Column | Type   | Options     |  <!-- チャットルーム -->
| ------ | ------ | ----------- |
| title  | text   | null: false |
| video  | string | null: false |

### Association

- belongs_to :post
- has_many :message



## messages テーブル

| Column   | Type   | Options     |  <!-- チャットルーム中 -->
| -------- | ------ | ----------- |
| text     | text   | null: false |
| contents | string |             |
| image    | string | null: false |
| user_id  | string | null: false |

### Association

- belongs_to :room
- belongs_to :user