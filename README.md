# ☆pluck

☆pluck is a Rails app for sifting through my favorites list on Twitter.

## Motivation

Twitter is my number one source for content that interests me. I almost exclusively consume Twitter on my iPhone. Unfortunately, there are a lot of longer pieces that end up shared in my stream that I'd like to read at my leisure. I don't really use Instapaper, but I do have a habit of favoriting the things that interest me. Alas, there seems to be no simple way to go through my favorites using Twitter itself.

And so, ☆pluck was born.

## Development

### Basics

This assumes development on Mac OS X. Things you should have installed are listed below with the easiest way to get them if you do not:

- Homebrew

`$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

- Git

`$ brew install git`

- RVM

`$ curl -sSL https://get.rvm.io | bash -s stable`

- PostgreSQL

Download from [here](https://github.com/PostgresApp/PostgresApp/releases/download/9.3.4.2/Postgres-9.3.4.2.zip), drag to the applications folder, and double-click.

If Terminal responds to `brew`, `git`, `rvm`, and `psql`, continue on.

### Setup

Clone the app and `bundle`:

```
$ git clone git@github.com:O-I/pluck.git
$ cd pluck
$ bundle install
```

You'll need Twitter keys. Get them [here](https://dev.twitter.com). Then create a `.env` file in the root that mimics the structure of `.env_example` using your development keys.

Create and migrate the database:

```
$ rake db:create
$ rake db:migrate
```

If you would like to get all of your favorites in one shot, run `rake pluck:all`. Note, to prevent hitting an API rate limit, I stagger each bulk call of 200 tweets by one minute. So, if you have 2000 favorites, it will take about 10 minutes to populate the database. Feel free to experiment with removing this time delay. It is likely overly cautious, but since you'll only ever realistically have to run this rake task once, I think the point is moot. I do not know whether there is a hard limit on how many favorites you can pluck. If it is anything like the restrictions on your timeline, then you can only access your last 3200 favorites through the API.

Alternatively, if you'd just like to test this out with a subset of your favorites, run `rake pluck:recent[200]` and the database will be populated with at most your last 200 favorites.

Run `rails s` and point your browser to [http://localhost:3000](http://localhost:3000) and you should be good to go!