class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :member_id, null: false
      t.integer :shop_id, null: false

      t.timestamps
    end
  end
end
