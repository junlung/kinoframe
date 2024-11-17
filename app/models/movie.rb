class Movie < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search, against: [:title, :overview],
    using: { tsearch: { prefix: true } }
    
  has_many :movie_list_items
  has_many :movie_lists, through: :movie_list_items
  
  has_many :movie_directors
  has_many :directors, through: :movie_directors
end
