Christchurch City Kerbside Mobile App
=====================================

Quite possibly the coolest app ever for finding out what bin you need
to put outside.

Also quite possibly the most badly written and untested one too ;)

Simply clone the repo.  Copy `.env_example to .env` and bundle and start with
`bundle exec rackup config.ru`

Note, this really assumes there's only one hit for your property, you may
well need to tweak if your house returns multiple results. Good luck, send
a pull request ;)

The page is _not_ mounted at the root url, for.. ummm.. no particularly good
reason.  Maybe I should change that.  Anyway.. it's at /myhouse .

If you push this up to heroku (it'll work) just use
`heroku config:set HOUSE_NUMBER=number HOUSE_STREET_NAME=whatever`

Good luck!

