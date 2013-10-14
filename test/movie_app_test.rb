require 'test/unit'
require 'rack/test'
require_relative '../movie_app'

class MovieServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_welcome_page
    get '/'
    assert last_response.ok?
  end

  def test_missing_name_redirects_home
    post '/film', { :name => ""}
    follow_redirect!
    assert_equal last_request.path, '/'
  end

  def test_missing_name_redirects_home
    post '/film', { :name => "Jaws"}
    assert last_response.ok?
  end

end