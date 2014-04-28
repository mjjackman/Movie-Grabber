require_relative './helper'

class MovieTest < Test::Unit::TestCase

	def test_save
		m = Movie.new
		assert m.save
		assert_equal 1, @collection.count
		assert_equal "Jaws", @collection.find_one["title"]
		assert_not_nil m.id
	end

	def test_find_by_title
		@collection.insert(:title => "Jaws")

		m = Movie.find_by_title("Jaws")
		assert_equal "Jaws", m.title
	end

	def test_update_attributes
		@collection.insert(:title => "Jaws")
		m = @collection.find_one

		assert m.update_attributes(:title => "Jaws 2")
		assert_equal "Jaws 2", @collection.find(:title => "Jaws 2")["title"]
	end

	def test_destroy
		@collection.insert(:title => "Jaws")
		m = Movie.find_by_title("Jaws")
		m.destroy
		assert_equal 1, @collection.count
	end

  def test_get_film_info_method
    Movie.get_film_info("jaws")

    movies = @collection.find(:title => 'jaws')
    assert_equal 1, movies.length
    assert_equal "Jaws", movies.first[1]
    # Add other parts to your test here...
  end

end
