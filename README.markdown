# StoreEngine

## Welcome to Frank's Monsterporium, a faux online store

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

This project was created for the gSchool StoreEngine Project. The background for this project can be found at: http://tutorials.jumpstartlab.com/projects/store_engine.html

### Installing Frank's Creatures Shop on your computer:

Once you've git cloned this repo, make sure to run

```bash
bundle install
createuser -sdR monster
createdb -O monster monster_development
psql -U monster -d monster_development -f db/monster_development.pgdump
bundle exec rake db:test:prepare
```
Then, to view the site from your computer, you can then run ```unicorn``` to view it at http://localhost:8080.
