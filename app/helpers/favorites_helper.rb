module FavoritesHelper
  def link_to_tweeter(favorite)
    link_to favorite.tweeter_name, "https://twitter.com/#{favorite.tweeter_screen_name}", id: 'tweeter_link'
  end

  def link_to_tweet_id(favorite)
    link_to("#{time_ago_in_words favorite.date_tweeted} ago",
            "https://twitter.com/#{favorite.tweeter_screen_name}/status/#{favorite.tweet_id}",
            id: 'tweet_link')
  end
end
