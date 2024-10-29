class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :tagline
      t.text :overview
      t.integer :tmdb_id
      t.string :poster_path
      t.string :string
      t.string :backdrop_path
      t.date :release_date
      t.integer :runtime
      t.integer :budget
      t.integer :revenue
      t.string :status

      t.timestamps
    end
  end
end
