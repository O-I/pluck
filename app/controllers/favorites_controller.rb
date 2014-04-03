class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.page(params[:page]).order(sort)
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  private

  def sort
    params[:sort] || 'date_tweeted DESC'
  end
end
