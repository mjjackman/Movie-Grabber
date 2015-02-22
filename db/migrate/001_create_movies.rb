class CreateMovies < ActiveRecord::Migration

  def up
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :actors
      t.string :directors
      t.text :description
    end
  end

  def down
    drop_table :movies
  end

end