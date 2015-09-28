require 'sinatra'
require 'sqlite3'
require 'pry'
require 'httparty'
require 'json'
require 'active_record'
require 'sinatra/reloader'
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

get '/:title' do
  @movie = Movie.where('LOWER(title) LIKE ?', params[:title]).first
  if @movie
    return @movie.to_json
  else
    status 404
    body ''
  end
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  @title = params[:name]
  redirect('/') if (@title == '')

  # Lookup the film information on the web
  film = Movie.get_film_info(@title)
  # store the film in the database
  # Display the movie in the page
  redirect "/#{@title.downcase}"
end
