FROM ruby:2.6.6-slim-buster
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    APP_HOME=/app

ARG PERFORMER_UID=1000

RUN apt-get update -qq \
 && apt-get install -y \
    curl \
    gnupg \
 && useradd -m -u ${PERFORMER_UID} performer \
 && mkdir ${APP_HOME} \
 && chown performer: ${APP_HOME}

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    nodejs \
    yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install \
 && rm Gemfile*

USER performer
WORKDIR ${APP_HOME}
COPY --chown=performer . ${APP_HOME}
