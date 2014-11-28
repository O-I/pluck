module FavoritesHelper
  def profile_pic(favorite)
    image_tag favorite.tweeter_profile_image_url.to_s, class: 'fave-profile-pic'
  end

  def link_to_tweeter(favorite)
    link_to favorite.tweeter_name, "https://twitter.com/#{favorite.tweeter_screen_name}", class: 'tweeter_link', target: '_blank'
  end

  def link_to_tweet_id(favorite)
    link_to "#{time_ago_in_words favorite.date_tweeted} ago",
            "https://twitter.com/#{favorite.tweeter_screen_name}/status/#{favorite.tweet_id}",
            class: 'tweet_link', target: '_blank'
  end

  def text_to_true_link(tweet_text)
    urls = tweet_text.scan(/https*:\/\/t.co\/\w+/)
    urls.each do |url|
      tweet_text.gsub!(url, "<a href=#{url} target='_blank'>#{url}</a>")
    end
    tweet_text.html_safe
  end
end