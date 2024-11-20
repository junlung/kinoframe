class Api::MovieListsController < ApplicationController
  def index
    movie_lists = current_user.movie_lists
    render json: movie_lists
  end

  def show
    movie_list = current_user.movie_lists.find(params[:id])
    render json: movie_list
  end

  def create
    movie_list = current_user.movie_lists.build(movie_list_params)
    if movie_list.save
      render json: movie_list, status: :created
    else
      render json: { errors: movie_list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_item
    movie_list = current_user.movie_lists.find(params[:id])
    movie_list_item = movie_list.movie_list_items.build(movie_list_item_params)
    if movie_list_item.save
      render json: movie_list_item, status: :created
    else
      render json: { errors: movie_list_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def movie_list_params
    params.require(:movie_list).permit(:name)
  end

  def movie_list_item_params
    params.permit(:movie_id)
  end
end