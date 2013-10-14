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
* How could we make our program grab more than one movie?
* Add a method to print all the movies in the database
* Add a method to search for all the movies in the database.
* Add code to the views/layout.erb so that we have a valid HTML website.
  * I want a header, with your website title and a search box.
  * I want a welcome page, so that when I visit '/' I see a nice welcome message and some instructions on how to use the application.
  * I want to type the name of a film into the search box, and when I press 'Search', I see a picture of the film, and information about the Movie.
* Protect all the URLs in your application with a 'private beta' landing page. Only let through users if they type the password 'coolbananas', whereupon they can use the site without having to type their password again.
* If a user types the wrong password, show a flash message that informs them to follow the IMDB twitter account if they are interested in joining
* If a user types the right password, show a flash message welcoming them to the application.
* Change the application so that it validates that I type in the name of a film
* Change the application so that it works if the IMDB is down, or doesn't find the film, whereupon we send a 404 not found
* Change the application so that we persist the information to a Mongo database. If the search is found in the local database, we want to use that information, instead of making unnecessary calls to IMDB.
* Add HTML / CSS to make your website look pretty.
* When you're done, send me a pull request.

# DEPLOYMENT

* Login to Heroku by typing:

```
    heroku login
```

* Create an app on Heroku using:

```
    heroku create
```

* Make a note of the URL it gives you. Will be something like
http://cool-bananas-922.herokuapp.com.
* Push the example app from your cloned repository to your heroku repository:

```
    git push heroku master
```
* Cut+paste your heroku URL into your favourite web browser. You should see
the example app.

* Then its burritos and beer time!
