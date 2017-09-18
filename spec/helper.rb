require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'database_cleaner'

require './film_app'

class MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'db/test.db'
    )

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
