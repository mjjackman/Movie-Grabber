require './test/helper'

class MovieAppTest < MiniTest::Test
  def test_welcome_page
    get '/'
    assert last_response.ok?
  end

  def test_visiting_a_film_page
    Movie.create!(:title => "Jaws")
    get '/jaws'

    assert last_response.ok?
    assert_match /Jaws/, last_response.body
  end

  def test_visiting_a_missing_film_page
    get '/matrix'
    assert_equal 404, last_response.status
  end

  def test_missing_name_redirects_home
    post '/film', { :name => ""}
    follow_redirect!
    assert_equal last_request.path, '/'
  end

  def test_finding_a_film_works
    post '/film', { :name => "Jaws"}

    # Redirect to your show page that displays movie data
    assert last_response.redirect?
    follow_redirect!

    assert_equal last_request.path, '/jaws'
    assert_match /Jaws/, last_response.body
    assert_match /Roy Scheider/, last_response.body
    assert_match /Spielberg/, last_response.body
    assert_match /1975/, last_response.body
    assert_match /shark/, last_response.body
  end

  def test_finding_a_film_saves_it_in_the_db
    post '/film', { :name => "Jaws"}
    assert_equal 1, Movie.count
    post '/film', { :name => "Jaws"}
    assert_equal 1, Movie.count
  end

  def test_new_film_page
    get '/new'
    assert last_response.ok?
  end

  def test_create_film
    post '/create', { "title" => "Jaws 2"}
    assert_equal 1, Movie.count(:title => "Jaws 2")
  end

  def test_edit_film_page
    get '/edit'
    assert last_response.ok?
  end

  def test_update_film
    m = Movie.create!(:title => "Jaws")
    post '/update', { "id" => m.id, "title" => "Jaws 2"}
    assert_equal 1, Movie.count(:title => "Jaws 2")
  end

end
