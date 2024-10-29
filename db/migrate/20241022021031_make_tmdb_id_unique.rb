class MakeTmdbIdUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :movies, :tmdb_id, unique: true
  end
end
