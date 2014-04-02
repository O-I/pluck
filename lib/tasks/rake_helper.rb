module RakeHelper
  def self.creator(fave)
    Favorite.create( tweet_id: fave.id,
                       date_tweeted: fave.created_at,
                       text: fave.text,
                       tweeter_id: fave.user[:id],
                       tweeter_name: fave.user[:name],
                       tweeter_screen_name: fave.user[:screen_name],
                       retweet_count: fave.retweet_count,
                       favorite_count: fave.favorite_count,
                       urls: fave.attrs[:entities][:urls].map do |url|
                               url[:display_url]
                             end)
  end
end