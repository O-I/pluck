class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.page(params[:page]).order('created_at DESC')
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
