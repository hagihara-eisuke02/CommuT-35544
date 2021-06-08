class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :title_id       ,foreign_key:true
      t.timestamps
    end
  end
end
