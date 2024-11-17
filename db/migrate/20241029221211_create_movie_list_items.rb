class CreateMovieListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_list_items do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :movie_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
