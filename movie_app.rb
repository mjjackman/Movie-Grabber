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
