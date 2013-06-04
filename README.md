A lightweight geocoder gem that returns an array of the latitude and longitude for an address.

## Installation

Add this line to your application's Gemfile:

    gem 'locationator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install locationator

## Usage

There are 3 methods in this gem:

    Location.lat("800 W. Huron St Chicago, IL")

will return the latitude.

    Location.lng("800 W. Huron St Chicago, IL")

will return the longitude

    Location.lat_lng("800 W. Huron St Chicago, IL")

will return an array of the latitude and longitude.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request