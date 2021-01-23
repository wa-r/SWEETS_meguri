class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.integer :shop_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
