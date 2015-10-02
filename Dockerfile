FROM ubuntu:15.04

ENV APP_HOME /app
ENV RUBY_VERSION 2.1.7
ENV PATH /usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-$RUBY_VERSION/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive
ENV BUNDLE_GEMFILE $APP_HOME/Gemfile
ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH /bundle

# create /app folder and set it as workdir
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# update and upgrade packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  build-essential \
  curl \
  git \
  imagemagick \
  libmagickcore-dev \
  libmagickwand-dev \
  && apt-get clean

# install rvm
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN \curl -sSL https://get.rvm.io | bash -s stable

# install rvm requirements and ruby
RUN rvm requirements
RUN rvm install $RUBY_VERSION
RUN gem install bundler --no-ri --no-rdoc

# Fix rmagick
RUN ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/bin/Magick-config

# install app requirements
ADD Gemfile* $APP_HOME/
RUN bundle install

# add soucecode to /app
ADD . $APP_HOME
