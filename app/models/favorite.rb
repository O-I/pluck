class Favorite < ActiveRecord::Base
  serialize :urls, Array
  serialize :tweeter_profile_image_url, Addressable::URI

  validates_uniqueness_of :tweet_id

  self.per_page = 25
end
