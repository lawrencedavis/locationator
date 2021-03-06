A lightweight geocoder gem that uses Google Maps' geocoder service to return basic information about an address including latitude, longitude, zip code, and formatted Address

## Installation

Add this line to your application's Gemfile:

    gem 'locationator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install locationator

## Usage

### Pass an address to Google Maps' Geocoder Service:

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

    $ Locationator.format("800 W. Huron St Chicago, IL")
    => "800 West Huron Street, Chicago, IL 60642, USA"

### Or use FreeGeoIP to geolocate based on IP address:

###### (These methods are slower and less precise than passing an address, for pretty obvious reasons.)

Return the latitude based on a user's IP address:

    $ Locationator.ip_lat
    => 41.8953
    
Return the longitude based on a user's IP address:

    $ Locationator.ip_lng
    => -87.648
    
Return an array of the latitude and longitude based on a user's IP address:

    $ Locationator.ip_lat_lng
    => [41.8953, -87.648]

## TODOs
- Find a better way of locating the postal code in Google Maps' JSON response.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
