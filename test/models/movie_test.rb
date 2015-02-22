require './test/helper'

class MovieTest < MiniTest::Test

  def test_get_film_info_method
    movie = Movie.get_film_info("Jaws")

    movies = Movie.where(:title => 'Jaws')
    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first.title

    # Add other parts to your test here...
  end

end
