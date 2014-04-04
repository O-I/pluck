class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.order(sort).page(params[:page])
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  private

  def sort
    "#{sort_column} #{sort_direction}"
  end

  def sort_column
    sortable_columns = %w(date_tweeted favorite_count retweet_count)
    sortable_columns.include?(params[:col]) ? params[:col] : 'date_tweeted'
  end

  def sort_direction
    %w(ASC DESC).include?(params[:dir]) ? params[:dir] : 'DESC'
  end
end
