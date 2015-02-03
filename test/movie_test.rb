require_relative './helper'

class MovieTest < MiniTest::Test

  def test_get_film_info_method
    movie = Movie.get_film_info("Jaws")

    movies = Movie.find_by(:title => 'Jaws')
    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first[1].title

    # Add other parts to your test here...
  end

end
