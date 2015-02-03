class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    binding.pry

    # Create a Movie object...
    m = Movie.new

    # Fill in the attributes...

    # Store me in a database...
  end

end