class Favorite < ActiveRecord::Base
  serialize :urls, Array
end
