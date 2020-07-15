FROM ruby:2.5.3

ENV BUNDLER_VERSION=2.0.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]