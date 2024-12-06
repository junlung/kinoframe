require 'zlib'
require 'open-uri'

class BulkMovieImporter
  def self.call
    new.call
  end

  def call
    write_to_file
  end

  private

  def write_to_file
    buffer = []
    URI.open(url) do |compressed_file|
      File.open(path, "wb") do |file|
        Zlib::GzipReader.open(compressed_file).each_line do |line|
          buffer << JSON.parse(line)["id"]
          if buffer.size >= chunk_size
            BackgroundMovieImporter.perform_async(buffer)
            buffer = []
          end
        end
      end
    end
    BackgroundMovieImporter.perform_async(buffer) if buffer.any?
  end

  def path
    "tmp/movie_ids.json.gz"
  end

  def chunk_size
    100
  end

  def url
    date = 1.day.ago.strftime("%m_%d_%Y")
    "http://files.tmdb.org/p/exports/movie_ids_" + date + ".json.gz"
  end
end