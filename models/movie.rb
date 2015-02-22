class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    m = Movie.new({
      :title => movie_info["Title"],
      :year => movie_info["Year"],
      :directors => movie_info["Director"],
      :actors => movie_info["Actors"],
      :description => movie_info["Plot"]
    })
    m.save!
    m
  end
end