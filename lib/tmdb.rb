class Tmdb
  require 'httparty'

  def fetch_movie_by_id(movie_id)
    url = "https://api.themoviedb.org/3/movie/#{movie_id}"
    client.get(url)
  end

  private

  def client
    @client ||= APIClient.new(ENV['TMDB_API_KEY'])
  end

  class APIClient
    def initialize(api_key)
      @api_key = api_key
    end

    def get(url)
      signed_url = "#{url}?api_key=#{@api_key}"
      response = HTTParty.get(signed_url)
      response.parsed_response
    end
  end
end