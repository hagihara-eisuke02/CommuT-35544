# README
## ・アプリケーション名 <br>
　CommuT(コミュット)

## ・アプリケーションの概要<br>
　コミュニケーションは宝物であるをコンセプトに掲示板型チャットサービスを開発しました。<br>
　アプリケーション名の由来は『Communication』と『Treasure』としています。<br>
　また、昨今のコミュニケーションサービスのニーズを網羅するためビデオチャットと通話サービスも開発しております。
<br>
## ・制作背景<br>
　様々な、コミュニケーションの場所を提供したい。<br>
　そんな想いから掲示板型のチャットサービスを開発しました。<br>
　手軽にすぐ話せる、すぐ繋がれるを目標に新規登録後すぐに投稿ができる仕様となっているのも特徴です。<br>

## ・DEMO<br>
新規登録画面<br>
![registration-image.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/7c238bdeb6ed39c0020f623ad0a8a141574eee03/README-images/registration-image.png)<br>
 ログイン画面<br>
![login-image.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/26a36552a66f5b7261009a7f9c2cce397bb8707f/README-images/rogin-image.png)<br>
 投稿フォーム<br>
![post-in.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/d428b172fd192a0cb5fde9aa2a520a2ca7d6f876/README-images/post-in.png)<br>
 トップページ<br>
![post-list.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/d428b172fd192a0cb5fde9aa2a520a2ca7d6f876/README-images/post-list.png)<br>
 投稿内容<br>
![post-show.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/c68caa2dc8bb12e5a1fcf2e62ccd762384629307/README-images/post-show.png)<br>
 チャット入室＆非同期テキストチャット<br>
![chat-main.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/c68caa2dc8bb12e5a1fcf2e62ccd762384629307/README-images/chat-main.png)<br>
 ビデオチャット＆非同期テキストチャット<br>
![chat-video-main.png](https://github.com/hagihara-eisuke02/CommuT-35544/blob/c68caa2dc8bb12e5a1fcf2e62ccd762384629307/README-images/chat-video-main.png)<br>
 
 
 
## ・実装予定
　詳細ページ編集＆削除機能
<br>　　詳細ページで投稿内容の編集と削除
<br><br>
　タイトル＆タグ検索機能<br>
　　トップページで探しやすいタイトル＆タグ検索機能
<br><br>
　マイページ機能<br>
　　マイページで投稿の修正・削除・自分の投稿一覧化＆<br>
　　友達機能(検索・登録・一覧・削除)＆限定ルーム開設<br>
　　お気に入りといいね一覧
<br><br>
　いいねやお気に入り機能<br>
　　投稿を評価できる
<br><br>
　セキュリティ機能<br>
　　ブロック・追放・通報・禁止ワード設定
<br><br>
　ランキング機能<br>
　　いいねやお気に入りから抽出し、掲示板のランキングをユーザーに決めてもらう機能
<br><br>

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| image              | string | null: false              |
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
