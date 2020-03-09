FROM ruby:2.7.0

RUN gem install nokogiri -- --use-system-libraries

RUN mkdir -p /convertor
WORKDIR /convertor

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 3

COPY . /convertor