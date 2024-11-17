class MovieList < ApplicationRecord
  belongs_to :user
  has_many :movie_list_items
  has_many :movies, through: :movie_list_items
end
