require './spec/helper'
require 'pry'

describe "FilmApp" do
  describe "GET to /" do
    before do
      get '/'
    end

    it "returns 200 OK" do
      assert last_response.ok?
    end
  end

  describe "with a previously created Film" do
    before do
      Film.create!(title: 'Jaws', year: 1975, poster: 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg')
    end

    describe "GET show film" do
      before do
        get '/films/jaws'
      end

      it "returns 200 OK" do
        assert last_response.ok?
      end

      it "displays the film title" do
        last_response.body.must_match /Jaws/
      end

      it "displays the film year" do
        last_response.body.must_match /1975/
      end

      it "displays the film image" do
        last_response.body.must_match /01_jaws_main_0.jpg/
      end
    end

    describe "GET to missing film" do
      before do
        get '/films/matrix'
      end

      it "returns 404" do
        last_response.status.must_equal 404
      end
    end
  end

  describe "Creating a film" do
    describe "with valid information" do
      before do
        post '/films', title: 'Jaws', year: 1975,
        poster: 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg'
      end

      it "does a 201 created" do
        last_response.status.must_equal 201
      end

      it "saves the films" do
        Film.count.must_equal 1
        Film.first.title.must_equal 'Jaws'
        Film.first.year.must_equal 1975
        Film.first.poster.must_equal 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg'
      end
    end

    describe "missing the title" do
      before do
        post '/films', title: ''
      end

      it "redirects home created" do
        assert last_response.redirect?
        follow_redirect!
        last_request.path.must_equal '/'
      end
    end

    describe "update the year" do
      before do
        Film.create!(title: 'Jaws', year: 1975, poster: 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg')
        put '/films/jaws', year: 2013
      end

      it 'updates the film' do
        last_response.status.must_equal 205
      end
    end

    describe "delete a film" do
      before do
        Film.create!(title: 'Jaws', year: 1975, poster: 'http://www.oscars.org/sites/oscars/files/01_jaws_main_0.jpg')
        # binding.pry
        delete '/films/jaws'
      end

      it 'deletes the film' do
        last_response.status.must_equal 204
      end
    end
  end

  # TODO - add tests for update and delete... what extra information do these
  # routes require in order to work (think collection or member!)
end
