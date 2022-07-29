class MoonFacade

  def self.get_moon_data(timestamp)
    json = MoonService.get_moon_data(timestamp)
    # binding.pry
    Moon.new(json.first)
  end
end
