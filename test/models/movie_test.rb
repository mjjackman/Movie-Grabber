require './test/helper'

class MovieTest < MiniTest::Test

  def test_get_film_info_method
    movie = Movie.get_film_info("Jaws")

    movies = Movie.where(:title => 'Jaws')
    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first.title
    assert_match /Roy Scheider/, movies.first.actors
    assert_match /Spielberg/, movies.first.director
    assert_match /1975/, movies.first.year
    assert_match /shark/, movies.first.description
  end

end
