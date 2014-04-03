class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.page(params[:page]).order(params[:sort])
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
