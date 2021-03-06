require_relative 'rake_helper'

namespace :pluck do
  desc "Get all favorited tweets of the user"
  task all: :environment do
    MAX = 200
    faves = []
    favorites_count = $client.user.favorites_count
    iterations = favorites_count / MAX + 1
    options = { count: MAX }
    iterations.times do |iter|
      options[:max_id] = faves.map(&:id).min - 1 unless faves.map(&:id).min.nil?
      faves += $client.favorites(options)
      puts "Iteration #{iter + 1} of #{iterations} complete"
      sleep 1.minute unless iter == iterations - 1
    end

    faves.each.with_index do |fave, index|
      begin
        puts "Adding favorite #{index} to database"
        RakeHelper::creator(fave)
      rescue => e
        puts "Something went wrong importing favorite #{index}. The exception is #{e.message}."
        next
      end
    end
  end

  desc "Get the most recent favorited tweets not in DB"
  task :recent, [:count] => :environment do |t, args|
    options = { count: args[:count] || 20 }
    options[:since_id] = Favorite.all.map { |t| t.tweet_id.to_i }.max
    options.delete_if { |_, v| v.nil? }
    faves = $client.favorites(options)
    faves.each { |fave| RakeHelper::creator(fave) }
    s = faves.size == 1 ? '' : 's'
    puts "#{faves.size} new favorite#{s} added"
  end

  desc "Remove duplicate favorites"
  task remove_dups: :environment do
    faves = Favorite.pluck(:tweet_id)
    freq = faves.each_with_object(Hash.new(0)) { |id, hash| hash[id] += 1 }
    duplicate_tweet_ids = freq.select { |_, val| val > 1 }.keys
    duplicates = Favorite.where(tweet_id: duplicate_tweet_ids)
    ids_to_destroy = duplicates.map(&:id).select(&:even?)
    quantity_removed = ids_to_destroy.size
    s = quantity_removed == 1 ? '' : 's'
    puts 'Removing duplicates...'
    Favorite.destroy(ids_to_destroy)
    puts "Removed #{quantity_removed} duplicate#{s}"
  end

  desc "Update profile pics"
  task update_pics: :environment do
    image_urls = Favorite.pluck('DISTINCT tweeter_profile_image_url')

    puts 'Determining how many profile urls need updating'
    puts 'This may take a while...'

    urls_to_update = image_urls.each_with_object([]) do |url, urls|
      response_code = Net::HTTP.get_response(url).code rescue nil
      urls << url unless response_code == '200'
    end

    urls_to_update_count = urls_to_update.size

    puts "Unique urls needing updates: #{urls_to_update_count}"
    puts 'Updating...'

    urls_to_update.each.with_index do |url, index|
      faves_to_update = Favorite.where('tweeter_profile_image_url = ?', url)

      begin
        handle = faves_to_update.first.tweeter_screen_name
        updated_profile_image_url = $client.user(handle).profile_image_url
      rescue => e
        puts "#{handle}'s profile pic could not be updated"
        next
      end

      faves_to_update.each do |fave|
        fave.update(tweeter_profile_image_url: updated_profile_image_url)
      end
      
      puts "Set #{index + 1} of #{urls_to_update_count} updated"
    end
  end
end