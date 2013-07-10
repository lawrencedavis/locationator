require 'spec_helper'

describe Locationator do

  before :each do
    @location = "800 W Huron St Chicago, IL"
  end

  describe ".lat" do
    it "should return a float" do
      Locationator.lat(@location).should be_a(Float)
    end
  end

  describe ".lng" do
    it "should return a float" do
      Locationator.lng(@location).should be_a(Float)
    end
  end

  describe ".lat_lng" do
    it "should return an array" do
      Locationator.lat_lng(@location).should be_a(Array)
    end

    it "should return an array with 2 values" do
      Locationator.lat_lng(@location).length.should eq(2)
    end

    it "should return an array with a float for the first value" do
      location1 = Locationator.lat_lng(@location).first
      location1.should be_a(Float)
    end

    it "should return an array with a float for the second value" do
      location2 = Locationator.lat_lng(@location).last
      location2.should be_a(Float)
    end
  end

  describe ".zip" do
    it "should return a string" do
      Locationator.zip(@location).should be_a(String)
    end

    it "should return a string that can be converted to an integer" do
      location = Locationator.zip(@location)
      location.to_i.should_not eq(0)
    end

    it "should be 5 digits long" do
      location = Locationator.zip(@location)
      location.length.should eq(5)
    end
  end

  describe ".format" do
    it "should return a string" do
      Locationator.format(@location).should be_a(String)
    end
  end

  describe ".ip_lat" do
    it "should return a float" do
      Locationator.ip_lat.should be_a(Float)
    end
  end

  describe ".ip_lng" do
    it "should return a float" do
      Locationator.ip_lng.should be_a(Float)
    end
  end

  describe ".ip_lat_lng" do
    it "should return an array" do
      Locationator.ip_lat_lng.should be_a(Array)
    end

    it "should return an array with 2 values" do
      Locationator.ip_lat_lng.length.should eq(2)
    end

    it "should return an array with a float for the first value" do
      location1 = Locationator.ip_lat_lng.first
      location1.should be_a(Float)
    end

    it "should return an array with a float for the second value" do
      location2 = Locationator.ip_lat_lng.last
      location2.should be_a(Float)
    end
  end
end