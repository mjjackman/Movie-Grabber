class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")

    # Create a Movie object...
    m = Movie.new

    # Fill in the attributes...
    m.title = imdb_data['Title']
    m.year = imdb_data['Year']
    m.genre  = imdb_data['Genre']
    m.director  = imdb_data['Director']
    m.writer  = imdb_data['Writer']
    m.actors  = imdb_data['Actors']
    m.description = imdb_data['Plot']

    # Store me in a database...
    m.save
    m
  end
end
