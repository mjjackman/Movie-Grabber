require 'test/unit'
require 'rack/test'
require 'httparty'
require 'json'
require 'pry'
require 'mongo'
require 'mocha'
require_relative '../movie'

class Test::Unit::TestCase
	def setup
		@db = Mongo::Connection.new["movie_test"]
		@collection = @db["movies"]
	end

	def teardown
		@db.collections.each do |collection|
			@db.drop_collection(collection.name) unless collection.name =~ /indexes$/
		end
	end
end