class Favorite < ActiveRecord::Base
  serialize :urls, Array
  serialize :tweeter_profile_image_url, Addressable::URI

  validates_uniqueness_of :tweet_id

  self.per_page = 25

  include PgSearch
  pg_search_scope :seek,
    against: { text: 'A', tweeter_name: 'B', tweeter_screen_name: 'C' },
    using: { tsearch: { dictionary: 'english' } },
    ignoring: :accents

  def self.search(query)
    query.present? ? seek(query) : all
  end
end