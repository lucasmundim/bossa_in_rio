FROM ruby:2.1.7

RUN mkdir -p /app
WORKDIR /app

# Fix rmagick
RUN ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/bin/Magick-config

COPY Gemfile Gemfile.lock /app/

ENV BUNDLE_PATH /bundle

RUN bundle install
