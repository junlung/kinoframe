class Api::MoviesController < ApplicationController
  skip_before_action :authenticate_request
  
  def index
    movies = Movie.all
    movies = movies.search(params[:query]) if params[:query].present?
    movies = movies.page(params[:page]).per(params[:per_page] || 10)
    render json: { movies: movies }
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end
end
