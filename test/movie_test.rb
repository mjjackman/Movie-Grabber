require_relative './helper'

class MovieTest < Test::Unit::TestCase

  def test_get_film_info_method
    Movie.get_film_info("jaws")

    # Don't forget to create your movies table first, using sqlite3...
    movies = @collection.find(:title => 'jaws')
    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first[1] # Note, this can change if you want/need
    # Add other parts to your test here...
  end

end
