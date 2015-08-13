FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim
RUN npm install -g phantomjs

RUN mkdir /myapp

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /myapp
ADD ./docker-entrypoint.sh /myapp/docker-entrypoint.sh
ADD ./setup.sh /myapp/setup.sh

WORKDIR /myapp

ENTRYPOINT /myapp/docker-entrypoint.sh