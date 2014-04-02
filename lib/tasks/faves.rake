namespace :favorites_list do
  desc "Get all favorited tweets of the user"
  task pluck_all: :environment do
    MAX = 200
    faves = []
    favorites_count = $client.user.favorites_count
    iterations = favorites_count / MAX + 1
    options = { count: MAX }
    iterations.times do |iter|
      options[:max_id] = faves.map(&:id).min unless faves.map(&:id).min.nil?
      faves += $client.favorites(options)
      puts "Iteration #{iter + 1} of #{iterations} complete"
      sleep 5.minutes unless iter == iterations - 1
    end

    faves.each.with_index do |fave, index|
      begin
        puts "Adding favorite #{index} to database"
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
      rescue => e
        puts "Something went wrong importing favorite #{index}. The exception is #{e.message}."
        next
      end
    end
  end

  desc "Get the most recent favorited tweets not in DB"
  task pluck_recent: :environment do
    greatest = Favorite.all.map { |t| t.tweet_id.to_i }.max
    faves = $client.favorites(since_id: greatest)
    faves.each do |fave|
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
    s = faves.size == 1 ? '' : 's'
    puts "#{faves.size} new favorite#{s} added"
  end
end