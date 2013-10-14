# Movies Homework

We're going to make a little program that grabs information about films and store it in the database.

# Install

1. Fork this repo, and git clone your own copy as normal.
2. Run bundle
```bundle```
3. Run the test using
```ruby test/movie_test.rb```
```ruby test/movie_app_test.rb```

You should get a binding.pry prompt with film information for "Jaws". We're going to extend this program to make a database.

# TODO

* Finish the get_film_info method, so that it takes information out of the movie_info hash and stores it in the database.
* Update your test, so that you can make sure that the movie is stored correctly.
* If you get this far, try the following extensions:
  * How could we make our program grab more than one movie?
  * Add a method to print all the movies in the database
  * Add a method to search for all the movies in the database.
  * Amend the program any way you see fit.
* When you're done, send me a pull request