# Bossa in Rio Hostel

This is the site for the Bossa in Rio Hostel

## Setup

Clone project and run bundle:

    docker-compose build web

Start local server:

    docker-compose up

Or:

    docker-compose run --rm --service-ports web

Open bash inside de container (eg: rails console):

    docker-compose run --rm --service-ports web bash

Install/Update gems:

    docker-compose run --rm web bundle

In order to run the server you should first populate the database:

    docker-compose run --rm web bundle exec rake db:seed

If you want to erase all existing data and populate it again:

    docker-compose run --rm web bundle exec rake db:reseed

## Running specs

Just run with rake:

    docker-compose run --rm web bundle exec rake spec
