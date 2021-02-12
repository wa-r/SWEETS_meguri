class CreateTweetLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_likes do |t|
      t.integer :member_id, null: false
      t.integer :tweet_id, null: false

      t.timestamps
    end
  end
end
