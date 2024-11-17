class MovieListItem < ApplicationRecord
  belongs_to :movie
  belongs_to :movie_list
end
