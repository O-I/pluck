FactoryGirl.define do
  factory :favorite do
    sequence(:tweet_id) { |n| n.to_s }
    date_tweeted '2011-11-15 05:08:02'
    text 'This tweet was intentionally left blank.'
    tweeter_id '2135732'
    tweeter_name 'Adrian Veidt'
    tweeter_screen_name 'ozymandias'
    tweeter_profile_image_url Addressable::URI.convert_path('https://pbs.twimg.com/profile_images/378800000565429354/350ed8f0e2135732d262d91f95f92b18_normal.png')
    retweet_count { rand(1..100) }
    favorite_count { rand(1..100) }
    urls ["j.mp/rpceya"]
  end
end