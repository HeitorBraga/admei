#!/usr/bin/env bash
docker-compose build
docker-compose run --rm railsapp bundle install && yarn install && bundle exec rake db:setup

