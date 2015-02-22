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
  erb :home
end

get '/:name' do
  @movie = Movie.find_by(:title => params[:name].capitalize)
  @movie ? erb(:show) : 404
end

post '/film' do
  redirect '/' if params[:name].blank?

  @movie = Movie.find_by(:title => params[:name].capitalize) ||
  @movie.get_film_info(params[:name])

  redirect "/#{@movie.title.downcase}"
end