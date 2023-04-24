FROM ruby:2.5-alpine

# Need timezones
RUN bin/sh -c set -ex && apk add --no-cache tzdata

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY hyper ./

ENV USERNAME admin
ENV PASSWORD password
ENV DSM http://localhost:5000
ENV TZ Australia/Sydney

RUN ln -sf /proc/1/fd/1 /var/log/synobackup.log
CMD "./hyper"
