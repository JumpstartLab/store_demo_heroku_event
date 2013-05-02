# StoreEngine

## Requirements

* [Ruby 1.9.3](https://rvm.io/)
* [Bundler](http://gembundler.com/)
* [Heroku Toolbelt](https://toolbelt.heroku.com)

We'll use SQLite3 in development.

## Setup

Clone the repository, then run:

```bash
bundle install
cp db/monster_demo db/monster_development
bundle exec rake db:test:prepare
bundle exec rails s
```

### Provisioning Heroku

You need to create an application on Heroku.

First, you'll need a heroku account. Sign up for one if you don't have one.

Then, from within the project directory:

```
$ heroku create
$ git push heroku master
```

### Updating Config

Open the `store_config.rb` in the root project directory and:

* Change the production URL to match the URL of your heroku deployment
* Change your email address to the one you used to register for this session

### Loading Data

Let's get all our base data running on Heroku:

```
heroku addons:add pgbackups
heroku pgbackups:restore DATABASE
'https://raw.github.com/JumpstartLab/store_demo/master/db/monster_development.pgdump'
```

### Install phantom.js
You'll need phantom.js to run the test suite locally:

```
brew install phantomjs
``` 

### You're ready to go!

## Performance

After getting your Heroku app up and running, fork this repo and visit https://travis-ci.org. From there:

* Sign in with your GitHub account
* Visit https://travis-ci.org/profile
* Flip the switch to `ON` on your forked store_demo repo

In your app, open `store_config.rb`, and change the values of `production_url` and `email_address` to your Heroku app URL and your email address:

```
  def self.production_url
    "http://my-demo-store.herokuapp.com"
  end

  def self.email_address
    "me@example.com"
  end
```

Push the updated `store_config.rb` to GitHub, and Travis will automatically run a set of timed tests against the specified URL. Once complete, you'll see a line at the bottom of your Travis logs that looks like this:

```
Runtime of 53.319523 submitted for me@example.com
```

This number gets sent off to Jumpstart Lab for scoring. Here's our performance goals for the night:

* Baseline performance: 50 seconds
* Bronze Performance: 42 seconds
* Silver Performance: 30 seconds
* Gold Performance: 15 seconds

Go for the gold!

## Appendix

### Using PostgreSQL

**First edit the `Gemfile`** to uncomment the `pg` line, and comment out the
`sqlite3` line.

```bash
bundle install
cp config/database.postgresql.yml config/database.yml
createuser -sdR monster
createdb -O monster monster_development
psql -U monster -d monster_development -f db/monster_development.pgdump
bundle exec rake db:test:prepare
bundle exec rails s
```

View the website at [localhost:8080](http://localhost:8080).

### Optional Poltergeist Setup

```
brew update
brew install phantomjs
```

## Welcome to Frank's Monsterporium, a faux online store

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

This project was created for the gSchool StoreEngine Project. The background for this project can be found at: http://tutorials.jumpstartlab.com/projects/store_engine.html

