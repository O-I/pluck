class Favorite < ActiveRecord::Base
  serialize :urls, Array

  self.per_page = 25
end
