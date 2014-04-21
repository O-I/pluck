class AddIndexToFavoritesTweetId < ActiveRecord::Migration
  def change
    add_index :favorites, :tweet_id, unique: true
  end
end