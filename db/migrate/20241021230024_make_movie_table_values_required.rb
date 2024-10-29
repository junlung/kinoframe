class MakeMovieTableValuesRequired < ActiveRecord::Migration[7.1]
  def change
    change_column_null :movies, :title, false
  end
end
