FROM ruby:3.0.2-alpine
ARG DATABASE_URL
ARG SECRET_KEY_BASE
ENV LANG=C.UTF-8 \
  TZ=Japan \
  RAILS_ENV=production \
  BUNDLE_WITHOUT="development:test" \
  DATABASE_URL=${DATABASE_URL} \
  SECRET_KEY_BASE=${SECRET_KEY_BASE}

WORKDIR /app
COPY Gemfile Gemfile.lock /app/

RUN apk update \
  && apk add --no-cache --virtual=.build-deps \
  build-base \
  && apk add --no-cache \
  postgresql-dev \
  tzdata \
  && bundle install \
  && apk del .build-deps
COPY . /app

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
