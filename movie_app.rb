require 'sinatra'
require 'mongo'
require 'pry'
require 'httparty'
require_relative 'movie'

get '/' do
  # Just have a nice welcome page
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  binding.pry

  # Lookup the film information on the web
  film = Movie.get_film_info("jaws")

  # store the film in the database

  # Display the movie in the page
end