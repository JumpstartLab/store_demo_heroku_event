# StoreEngine

## Welcome to Frank's Monsterporium, a faux online store

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

This project was created for the gSchool StoreEngine Project. The background for this project can be found at: http://tutorials.jumpstartlab.com/projects/store_engine.html

### Installing Frank's Creatures Shop on your computer:

#### Requirements

* [Ruby 1.9.3](https://rvm.io/)
* [Bundler](http://gembundler.com/)

The default setup uses SQLite3, but you can also use PostgreSQL.

#### (Default) Using SQLite3

Clone the repository, then run:

```bash
bundle install
cp db/monster_demo db/monster_development
bundle exec rake db:test:prepare
bundle exec unicorn
```

#### Using PostgreSQL

**First edit the `Gemfile`** to uncomment the `pg` line, and comment out the
`sqlite3` line.

```bash
bundle install
cp config/database.postgresql.yml config/database.yml
createuser -sdR monster
createdb -O monster monster_development
psql -U monster -d monster_development -f db/monster_development.pgdump
bundle exec rake db:test:prepare
bundle exec unicorn
```

View the website at [localhost:8080](http://localhost:8080).

## Provisioning Heroku

### Create the app

#### Add Add-Ons

```
heroku addons:add pgbackups
```

### Load the Starter Data

```
heroku pgbackups:restore DATABASE 'https://github.com/JumpstartLab/store_demo/blob/master/db/monster_development.pgdump?raw=true'
```

### Optional Poltergeist Setup

```
brew update
brew install poltergeist
```