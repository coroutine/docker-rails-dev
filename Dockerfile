FROM ruby:2.1.3
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs npm \
    && ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g phantomjs

RUN mkdir /myapp

