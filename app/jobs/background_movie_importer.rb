class BackgroundMovieImporter
  include Sidekiq::Job
  queue_as :default

  RATE_LIMIT = 400 * 60
  SLEEP_INTERVAL = 60.0 / RATE_LIMIT

  def perform(ids)
    movies = ids.map do |id|
      Rails.logger.info("Fetching movie: #{id}")
      movie = client.fetch_movie_by_id(id)
      Rails.logger.info("Found movie: #{movie")
      sleep(SLEEP_INTERVAL)
      formtted_movie = response_to_json(movie)
      Rails.logger.info("Importing movie: #{formtted_movie[:title]}")
      formtted_movie
    end

    begin
      Movie.upsert_all(movies, unique_by: :tmdb_id)
    rescue
      puts "Error: #{$!}"
    end
  end

  private

  def response_to_json(movie)
    {
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
  end


  def client
    @client ||= Tmdb.new()
  end
end
