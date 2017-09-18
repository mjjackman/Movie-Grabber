require 'sinatra'
require 'sqlite3'
require 'pry'
require 'json'
require 'active_record'
require 'uri'
require 'sinatra/reloader'

configure do
  db_config = YAML.load_file('db/config.yml')['development']

  ActiveRecord::Base.establish_connection(
    adapter: db_config['adapter'],
    database: db_config['database']
  )
end
Film.find_or_create_by(title: 'Jaws', year: 1975, poster: 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg')
Film.find_or_create_by(title: 'ET', year: 1982, poster: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc1NTQ0MTUyNF5BMl5BanBnXkFtZTcwMDYzMDU2Mw@@._V1_.jpg')



before "/film/*" do
  @film = Film.find_by(slug: Film.slugify(params[:title]))
end

get '/' do
  erb :home
end


get '/film/:title' do
  if @film.nil?
    404
  else
    erb :film
  end
end

get '/film' do
  erb :film
end


post '/film' do
  @film = Film.new(title: params[:title],
                  year: params[:year],
                  poster: params[:poster])
  unless @film.save
    redirect '/'
  else
    erb :film, :status => 201
  end
end

put '/film/:title' do
  @film.update(year: params[:year])
  205
end

delete '/film/:title' do
  @film.destroy
  204
end
