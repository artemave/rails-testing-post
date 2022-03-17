FROM ruby:2.7.5

WORKDIR /app

ENV RAILS_ENV=production

ADD Gemfile* /app/
RUN bundle install

ADD . /app/

RUN bundle exec rails webpacker:compile

ENV PORT=3000

CMD bundle exec rails server
