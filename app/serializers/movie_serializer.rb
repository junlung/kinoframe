class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :tagline, :overview, :release_date, :poster_path, :backdrop_path, :tmdb_id, :budget, :revenue, :status, :runtime
end