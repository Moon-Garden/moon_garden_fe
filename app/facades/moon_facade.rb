class MoonFacade
  def self.get_moon_data(timestamp)
    json = MoonService.get_moon_data(timestamp)
    require "pry"; binding.pry
    Moon.new(json.first)
  end
end
