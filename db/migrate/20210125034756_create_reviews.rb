class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :member_id, null: false
      t.integer :shop_id, null: false
      t.string :title
      t.text :content
      # 0.5単位で評価できるように、データ型にはfloatを使用
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
