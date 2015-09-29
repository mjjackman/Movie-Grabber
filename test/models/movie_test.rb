require './test/helper'

class MovieTest < MiniTest::Test

  def test_get_film_info_method
    movie = Movie.get_film_info("Jaws")

    movies = Movie.where(:title => 'Jaws')
    poster_url = "http://ia.media-imdb.com/images/M/MV5BNDcxODkyMjY4MF5BMl5BanBnXkFtZTgwOTk5NTc5MDE@._V1_SX300.jpg"

    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first.title
    assert_match /Roy Scheider/, movies.first.actors
    assert_match /Spielberg/, movies.first.director
    assert_match /1975/, movies.first.year
    assert_match /shark/, movies.first.description
    assert_match poster_url, movies.first.poster
  end

end
