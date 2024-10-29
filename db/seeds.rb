# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ids = [
  816,
  496243,
  11423,
  6977,
  115,
  348,
  670,
  78569,
  11459,
  920,
  679,
  11104,
  149,
  9614,
  817,
  818,
  1542,
  419430,
  762504,
  489412,
  303867,
  244786,
  11528,
  9820,
  4523,
  313369,
  614934,
  391713,
  884605,
  346698,
  331482,
  466272,
  792307,
  347031,
  152601,
  10681,
  762968,
  2493,
  264660
]

tmdbClient = Tmdb.new

ids.each do |id|
  movie = tmdbClient.fetch_movie_by_id(id)
  params = {
    title: movie['title'],
    tagline: movie['tagline'],
    overview: movie['overview'],
    release_date: movie['release_date'],
    poster_path: movie['poster_path'],
    backdrop_path: movie['backdrop_path'],
    tmdb_id: movie['id'],
    budget: movie['budget'],
    revenue: movie['revenue'],
    status: movie['status'],
    runtime: movie['runtime'],
  }
  Movie.find_or_create_by!(params)
end