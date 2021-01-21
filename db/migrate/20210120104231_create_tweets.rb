class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :member_id, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.string :image_id
      t.timestamps
    end
  end
end