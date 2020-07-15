# Schedule Module - API

### Tech

* Ruby 2.5.3
* Ruby On Rails 6.0.3
* Postgres 9.6

### Installation

Create a `.env` file according to the `.env.example`

```
DATABASE_NAME=
DATABASE_USER=
DATABASE_PASSWORD=
DATABASE_HOST=
```

Initialize docker and run the script

```sh
$ docker-compose up
$ docker-compose exec app bundle exec rails db:setup db:migrate
```
### Test

```sh
$ docker-compose exec app rake
```

### Documentation

https://caren-schedule-module-api.herokuapp.com/api/v1/docs