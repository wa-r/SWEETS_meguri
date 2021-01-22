class CreateTweetComments < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_comments do |t|
      t.integer :member_id, null: false
      t.integer :tweet_id, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
