# Demo app

## Setup

Run site:

    bundle install
    rails webpacker:compile
    rails db:prepare
    rails s

Run tests:

    # rack-test
    rails test:system

    # js
    JS=1 rails test:system

    # gui
    GUI=1 rails test:system
