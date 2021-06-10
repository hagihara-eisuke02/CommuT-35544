class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title         ,null: false
      t.string     :sentence      ,null: false
      # t.references :message_id    ,foreign_key: true
      t.references :user          ,foreign_key: true
      t.timestamps
    end
  end
end
