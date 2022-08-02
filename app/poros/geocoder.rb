class Geocoder
  attr_reader :coordinates

  def initialize(lat, lng)
    @coordinates = lat.concat(',').concat(lng)
  end
end
