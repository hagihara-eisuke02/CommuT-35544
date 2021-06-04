class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title         ,null: false
      t.string     :message       ,null: false
      # t.references :room_id       ,foreign_key: true
      t.references :user          ,foreign_key: true
      t.timestamps
    end
  end
end