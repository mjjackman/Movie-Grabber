class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)

    # Create a Movie object...
    m = Movie.new

    # Fill in the attributes...
    m.title = movie_info['Title']
    m.year = movie_info['Year']
    m.genre  = movie_info['Genre']
    m.director  = movie_info['Director']
    m.writer  = movie_info['Writer']
    m.actors  = movie_info['Actors']
    m.description = movie_info['Plot']

    # Store me in a database...
    m.save
  end
end
