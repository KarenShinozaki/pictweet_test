class RemoveNameFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :name, :string
  end
end

#string属性の:nameカラムをtweetsテーブルから削除している
