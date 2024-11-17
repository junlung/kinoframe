class Movie < ApplicationRecord
  has_many :movie_list_items
  has_many :movie_lists, through: :movie_list_items
  
  has_many :movie_directors
  has_many :directors, through: :movie_directors
end
