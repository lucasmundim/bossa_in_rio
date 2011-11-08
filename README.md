# Bossa in Rio Hostel

This is the site for the Bossa in Rio Hostel.

## Setup

Clone project and run bundle:

    gem install bundler
    bundle install

In order to run the server you should first populate the database:

    rake db:seed
    
If you want to erase all existing data and populate it again:

    rake db:reseed

## Running specs

Just run with rake:

    rake spec

