class Favorite < ActiveRecord::Base
  serialize :urls, Array
  serialize :tweeter_profile_image_url, Addressable::URI

  validates_uniqueness_of :tweet_id

  self.per_page = 25

  include PgSearch
  pg_search_scope :find, 
    against: [:tweeter_name, :tweeter_screen_name, :text],
    using: { tsearch: { dictionary: 'english' } }

  def self.search(query)
    if query.present?
      find(query)
    else
      all
    end
  end
end
