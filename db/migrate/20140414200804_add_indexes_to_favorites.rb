class AddIndexesToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, :date_tweeted
    add_index :favorites, :tweeter_name
    add_index :favorites, :tweeter_screen_name
    add_index :favorites, :retweet_count
    add_index :favorites, :favorite_count
  end
end
