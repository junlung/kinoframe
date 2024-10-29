class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.page(params[:page]).per(params[:per_page] || 10)
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end
end
