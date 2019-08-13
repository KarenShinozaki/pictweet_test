class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text :text
      t.timestamps
    end
  end
end

#commentsテーブルにinteger属性のuser_id,tweets_idを作成
#text属性でtext欄も作成している。
