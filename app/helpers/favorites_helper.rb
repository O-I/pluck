module FavoritesHelper
  def link_to_tweeter(favorite)
    link_to favorite.tweeter_name, "https://twitter.com/#{favorite.tweeter_screen_name}", id: 'tweeter_link'
  end
end
