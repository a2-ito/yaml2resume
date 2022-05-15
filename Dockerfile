FROM ruby:2-alpine
RUN apk upgrade --no-cache && \
    apk add --no-cache --virtual build-dependencies build-base=0.5-r2 && \
    rm -rf /var/cache/apk/*
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app
COPY yaml_cv /usr/src/app
COPY fonts /usr/src/app/fonts
RUN bundle install
