require 'sinatra'
require 'sqlite3'
require 'pry'
require 'httparty'
require 'json'
require 'active_record'
require_relative 'models/movie'

configure do
  db_config = YAML.load_file('db/config.yml')["development"]

  ActiveRecord::Base.establish_connection(
    :adapter => db_config["adapter"],
    :database => db_config["database"]
  )
end

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