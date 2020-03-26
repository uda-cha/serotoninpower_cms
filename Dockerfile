FROM ruby:2.6.5
ENV LANG C.UTF-8

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y \
    build-essential \
    default-mysql-client \
    nodejs \
    yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
