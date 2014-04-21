require_relative 'rake_helper'

namespace :favorites_list do
  desc "Get all favorited tweets of the user"
  task pluck_all: :environment do
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
  task pluck_recent: :environment do
    greatest = Favorite.all.map { |t| t.tweet_id.to_i }.max
    faves = $client.favorites(since_id: greatest)
    faves.each do |fave|
      RakeHelper::creator(fave)
    end
    s = faves.size == 1 ? '' : 's'
    puts "#{faves.size} new favorite#{s} added"
  end

  desc "Remove duplicate favorites"
  task remove_dupluckates: :environment do
    freq = Hash.new(0)
    faves = Favorite.pluck(:tweet_id)
    faves.each { |fave| freq[fave] += 1 }
    duplicate_tweet_ids = freq.select { |_, val| val > 1 }.keys
    duplicates = Favorite.where(tweet_id: duplicate_tweet_ids)
    ids_to_destroy = duplicates.map(&:id).select(&:even?)
    quantity_removed = ids_to_destroy.size
    s = quantity_removed == 1 ? '' : 's'
    puts 'Removing duplicates...'
    Favorite.destroy(ids_to_destroy)
    puts "Removed #{quantity_removed} duplicate#{s}"
  end
end