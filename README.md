A lightweight geocoder gem that uses Google Maps' geocoder service to return basic information about an address including latitude, longitude, zip code, and formatted Address

## Installation

Add this line to your application's Gemfile:

    gem 'locationator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install locationator

## Usage

There are 5 methods in this gem:

Return the latitude of an address:

    $ Locationator.lat("800 W. Huron St Chicago, IL")
    => 41.895347

Return the longitude of an address:

    $ Locationator.lng("800 W. Huron St Chicago, IL")
    => -87.648072

Return an array of the latitude and longitude of an address:

    $ Locationator.lat_lng("800 W. Huron St Chicago, IL")
    => [41.895347, -87.648072]

Return the postal (zip) code of an address:

    $ Locationator.zip("800 W. Huron St Chicago, IL")
    => "60642"
    
Return the properly formatted version of an address

    $ Locationator.zip("800 W. Huron St Chicago, IL")
    => "800 West Huron Street, Chicago, IL 60642, USA"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
