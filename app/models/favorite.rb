class Favorite < ActiveRecord::Base
  serialize :urls, Array
  serialize :tweeter_profile_image_url, Addressable::URI

  validates_uniqueness_of :tweet_id

  self.per_page = 25

  include PgSearch
  pg_search_scope :find, 
    against: { text: 'A', tweeter_name: 'B', tweeter_screen_name: 'C' },
    using: { tsearch: { dictionary: 'english' } }

  def self.search(query)
    query.present? ? find(query) : all
  end
end