FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /caren-api
WORKDIR /caren-api
COPY Gemfile /caren-api/Gemfile
RUN bundle install
COPY . /caren-api
