require_relative './helper'
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

  def test_finding_a_film_works
    post '/film', { :name => "Jaws"}
    assert last_response.ok?
    assert_match /Jaws/, last_response.body
    assert_match /Roy Scheider/, last_response.body
    assert_match /Spielberg/, last_response.body
    assert_match /1975/, last_response.body
    assert_match /shark/, last_response.body
  end

  def test_finding_a_film_saves_it_in_the_db
    HTTParty.expects(:get).once
    post '/film', { :name => "Jaws"}
    assert_equal 1, @collection.count
    post '/film', { :name => "Jaws"}
  end

  def test_visiting_a_film_page
    post '/film', { :name => "Jaws"}
    get '/jaws'
    assert last_response.ok?
    assert_match /Jaws/, last_response.body
    assert_match /Roy Scheider/, last_response.body
    assert_match /Spielberg/, last_response.body
    assert_match /1975/, last_response.body
    assert_match /shark/, last_response.body
  end

  def test_visiting_a_missing_film_page
    get '/matrix'
    assert_equal 404, last_response.status
  end

  def test_new_film_page
    get '/new'
    assert last_response.ok?
  end

  def test_create_film
    m = Movie.new
    m.title = "Jaws"
    m.save

    post '/create', { "title" => "Jaws 2"}
    assert_equal 1, @collection.find("title" => "Jaws 2").count
  end

  def test_edit_film_page
    get '/edit'
    assert last_response.ok?
  end

  def test_update_film
    m = Movie.new
    m.title = "Jaws"
    m.save

    post '/update', { "_id" => m.id, "title" => "Jaws 2"}

    assert_equal 1, @collection.find("title" => "Jaws 2").count
  end

end