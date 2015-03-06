FROM ruby:2.2.1
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs npm exuberant-ctags \
    && apt-get autoremove  -y \
    && apt-get clean -y \
    && ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g phantomjs

RUN mkdir /myapp

ONBUILD ADD Gemfile /myapp/Gemfile
ONBUILD ADD Gemfile.lock /myapp/Gemfile.lock
ONBUILD WORKDIR /myapp
ONBUILD RUN bundle install
ONBUILD ADD . /myapp

