require 'locationator/version'
require 'open-uri'
require 'json'
require 'net/http'

module Locationator

  # Returns the latitude
  def self.lat(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    lat = geocodeResponse["results"][0]["geometry"]["location"]["lat"]
  end

  # Returns the longitude
  def self.lng(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    lng = geocodeResponse["results"][0]["geometry"]["location"]["lng"]
  end

  # Builds an array of the latitude and longitude
  def self.lat_lng(address)
    lat_lng_array = []
    lat_lng_array.push(self.lat(address))
    lat_lng_array.push(self.lng(address))
  end

  # Returns the zip code for an address
  def self.zip(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    components = geocodeResponse["results"][0]["address_components"]
    # The postal code is always the last address component returned
    # TODO: Find a cleaner method of finding the postal code in the JSON
    zip = components[components.length - 1]["long_name"]
  end

  # Returns a properly formatted address
  def self.format(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    formatted = geocodeResponse["results"][0]["formatted_address"]
  end

  private
    
    # Builds the URL that we need to get our JSON response from Google
    def self.get_url(address)
      geocodePrimary = "http://maps.googleapis.com/maps/api/geocode/json?address="
      geocodeAddress = URI::encode(address)
      geocodeSensor = "&sensor=false"
      geocodeURL = geocodePrimary + geocodeAddress + geocodeSensor
    end

    # Sends the URL to Google and parses the response
    def self.get_data(url)
      response = Net::HTTP.get_response(URI.parse(url))
      data = JSON.parse(response.body)
    end

end
