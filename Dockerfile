FROM ruby:3

WORKDIR /app

ENV RAILS_ENV=production

ADD Gemfile* /app/
RUN bundle install

ADD . /app/

ENV PORT=3000

CMD bundle exec rails server
