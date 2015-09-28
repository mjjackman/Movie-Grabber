class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :description
    end
  end
end
