FROM ruby:2.7.5

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update -qq && apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /app
ENV RAILS_ENV=production
ENV PORT=3000

ADD Gemfile* /app/
RUN bundle install

ADD package.json yarn.lock /app/
RUN yarn install

ADD . /app/

CMD bundle exec rails server
