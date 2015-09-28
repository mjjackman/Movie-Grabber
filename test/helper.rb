require 'minitest/autorun'
require 'rack/test'
require 'mocha/setup'
require 'database_cleaner'

require './movie_app'

class MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => 'db/test.db'
    )

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    mock_data = JSON(File.read('test/jaws.json'))
    HTTParty.stubs(:get).returns(mock_data)
  end

  def teardown
    DatabaseCleaner.clean
  end
end
