class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
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
