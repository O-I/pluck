class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.page(params[:page]).order(params[:sort] + ' DESC')
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
