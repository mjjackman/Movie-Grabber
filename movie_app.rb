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

def movie_url(movie)
  "/#{@movie.title.downcase}"
end

get '/' do
  # Just have a nice welcome page
  erb :home
end

get '/new' do
end

get '/edit' do
end

post '/create' do
  @movie = Movie.create(params[:movie])
  redirect movie_url(@movie)
end

post '/update' do
  @movie = Movie.find(params[:movie][:id])
  @movie.update_attributes(params[:movie])
  redirect movie_url(@movie)
end

get '/:title' do
  @movie = Movie.where('LOWER(title) LIKE ?', params[:title]).first
  if @movie
    return @movie.to_json
  else
    status 404
    body 'Movie not found'
  end
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  @title = params[:title]
  redirect('/') if (@title == '')

  # Lookup the film information on the web
  film = Movie.get_film_info(@title)
  # store the film in the database
  # Display the movie in the page
  redirect "/#{@title.downcase}"
end
