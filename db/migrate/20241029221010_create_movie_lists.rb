class CreateMovieLists < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
