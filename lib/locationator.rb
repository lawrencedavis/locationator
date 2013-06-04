require 'locationator/version'
require 'open-uri'
require 'json'
require 'net/http'

class Locationator
  def self.lat(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    lat = geocodeResponse["results"][0]["geometry"]["location"]["lat"]
  end

  def self.lng(address)
    geocodeURL = get_url(address)
    geocodeResponse = get_data(geocodeURL)
    lng = geocodeResponse["results"][0]["geometry"]["location"]["lng"]
  end

  def self.lat_lng(address)
    lat_lng_array = []
    lat_lng_array.push(self.lat(address))
    lat_lng_array.push(self.lng(address))
  end

  private
  
  def self.get_url(address)
    geocodePrimary = "http://maps.googleapis.com/maps/api/geocode/json?address="
    geocodeAddress = URI::encode(address)
    geocodeSensor = "&sensor=false"
    geocodeURL = geocodePrimary + geocodeAddress + geocodeSensor
  end

  def self.get_data(url)
    response = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(response.body)
  end

end
