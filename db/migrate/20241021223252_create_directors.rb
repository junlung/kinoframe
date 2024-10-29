class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :tmdb_id
      t.string :profile_path

      t.timestamps
    end
  end
end
