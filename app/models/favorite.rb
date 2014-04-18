class Favorite < ActiveRecord::Base
  serialize :urls, Array
  serialize :tweeter_profile_image_url, Addressable::URI

  validates_uniqueness_of :tweet_id

  self.per_page = 25

  def self.search(query)
    if query.present?
      where('tweeter_name @@ :q or tweeter_screen_name @@ :q or text @@ :q',
            q: query)
    else
      all
    end
  end
end
