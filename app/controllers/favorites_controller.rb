class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.page(params[:page]).order('date_tweeted DESC')
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
