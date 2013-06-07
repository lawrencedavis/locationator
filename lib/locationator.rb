require 'locationator/version'
require 'open-uri'
require 'json'
require 'net/http'

module Locationator

  # Returns the latitude
  def self.lat(address)
    geocodeResponse = get_data(address)
    result = geocodeResponse["status"] == "ZERO_RESULTS" ? "Address not found." : geocodeResponse["results"][0]["geometry"]["location"]["lat"]
  end

  # Returns the longitude
  def self.lng(address)
    geocodeResponse = get_data(address)
    result = geocodeResponse["status"] == "ZERO_RESULTS" ? "Address not found." : geocodeResponse["results"][0]["geometry"]["location"]["lng"]
  end

  # Builds an array of the latitude and longitude
  def self.lat_lng(address)
    lat_lng_array = []
    lat_lng_array.push(self.lat(address))
    lat_lng_array.push(self.lng(address))
    result = lat_lng_array == ["Address not found.", "Address not found."] ? "Address not found." : lat_lng_array 
  end

  # Returns the zip code for an address
  def self.zip(address)
    geocodeResponse = get_data(address)
    if geocodeResponse["status"] == "ZERO_RESULTS"
      zip = "Address not found."
    else
      components = geocodeResponse["results"][0]["address_components"]
      # The postal code is always the last address component returned
      # TODO: Find a cleaner method of finding the postal code in the JSON
      zip = components[components.length - 1]["long_name"]
    end
  end

  # Returns a properly formatted address
  def self.format(address)
    geocodeResponse = get_data(address)
    result = geocodeResponse["status"] == "ZERO_RESULTS" ? "Address not found." : geocodeResponse["results"][0]["formatted_address"] 
  end

  # Returns the latitude based on the current user's IP address
  def self.ip_lat
    geocodeResponse = get_ip_data
    result = geocodeResponse["latitude"]
  end

  # Returns the longitude based on the current user's IP address
  def self.ip_lng
    geocodeResponse = get_ip_data
    result = geocodeResponse["longitude"]
  end

  # Returns an array of the latitude and longitude based on the current user's IP address
  def self.ip_lat_lng
    myArray = []
    geocodeResponse = get_data(address)
    myArray.push(geocodeResponse["latitude"])
    myArray.push(geocodeResponse["longitude"])
    result = myArray
  end

  private
    
    # Builds the URL that we need to get our JSON response from Google
    def self.get_data(address)
      geocodePrimary = "http://maps.googleapis.com/maps/api/geocode/json?address="
      geocodeAddress = URI::encode(address)
      geocodeSensor = "&sensor=false"
      geocodeURL = geocodePrimary + geocodeAddress + geocodeSensor
      response = Net::HTTP.get_response(URI.parse(geocodeURL))
      data = JSON.parse(response.body)
    end

    def self.get_ip_data
      geocodePrimary = "http://freegeoip.net/json/"
      response = Net::HTTP.get_response(URI.parse(geocodePrimary))
      data = JSON.parse(response.body)
    end

end
