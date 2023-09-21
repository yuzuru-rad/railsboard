FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /board_app

COPY Gemfile /board_app/Gemfile
COPY Gemfile.lock /board_app/Gemfile.lock

RUN bundle install
COPY . /board_app

CMD ["rails", "server", "-b", "0.0.0.0"]
