# StoreEngine

## Requirements

* [Ruby 1.9.3](https://rvm.io/)
* [Bundler](http://gembundler.com/)

We'll use SQLite3 in development.

## Setup

Clone the repository, then run:

```bash
bundle install
cp db/monster_demo db/monster_development
bundle exec rake db:test:prepare
bundle exec rails s Puma
```

### Provisioning Heroku

You need to create an application on Heroku. From within the project directory:

```
$ heroku create
```

### Updating Config

Open the `store_config.rb` in the root project directory and:

* Change the production URL to match the URL of your heroku deployment
* Change your email address to the one you used to register for this session

### Loading Data

Let's get all our base data running on Heroku:

```
heroku addons:add pgbackups
heroku pgbackups:restore DATABASE 'https://github.com/[TODO: URL for pgsql dump]'
```

### Install phantom.js
You'll need phantom.js to run the test suite locally:

```
brew install phantomjs
``` 

### You're ready to go!

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
bundle exec rails s Puma
```

View the website at [localhost:8080](http://localhost:8080).

### Optional Poltergeist Setup

```
brew update
brew install poltergeist
```

## Welcome to Frank's Monsterporium, a faux online store

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

This project was created for the gSchool StoreEngine Project. The background for this project can be found at: http://tutorials.jumpstartlab.com/projects/store_engine.html

