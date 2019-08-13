class AddUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer
  end
end

#tweetsテーブルに:user_idをinteger属性で作成している。これはアソシエーションをモデルで組んだため、DBでもusersテーブルのidカラムとtweetsテーブルのuser_idに互換性を組んでいる。
