class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :tweet_id
      t.datetime :date_tweeted
      t.text :text
      t.string :tweeter_id
      t.string :tweeter_name
      t.string :tweeter_screen_name
      t.integer :retweet_count
      t.integer :favorite_count
      t.text :urls

      t.timestamps
    end
  end
end
