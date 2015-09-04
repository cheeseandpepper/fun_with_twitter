# Fun With Twitter and React!

## Why

I wanted to experiment with React mostly.

Some personal thoughts...
I'm using a simple caching solution to not violate the Twitter API. I'm memoizing an instance of `ActiveSupport::Cache::MemoryStore` which is good enough for this small project. The controller will first check for a stored object, and if it's not found, it will hit Twitter and then store the object.

Speaking of the object... Storing the entire Tweet object is a little over kill, so I'm storing only what I need and using a Parsing class to coerce the text how I want it. @mentions and urls are linkified using this parsing class.

Some old code remains in the project for posterity. Before React, this was using a combination of plain AJAX and rendering partials.


## Setup

This was build with Rails 4.2.1 and Ruby 2.1.4p265

To run locally clone the project then...
`bundle install`
`bundle exec rails s`

To run the tests...
`bundle exec rspec`

[This project lives on Heroku](https://shrouded-badlands-1258.herokuapp.com/)
