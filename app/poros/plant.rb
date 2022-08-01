class Plant
  attr_reader :id, 
              :name, 
              :sun_requirements, 
              :description, 
              :sowing_method, 
              :spread, 
              :row_spacing, 
              :height,
              :main_image_path

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @sun_requirements = data[:attributes][:sun_requirements]
    @description = data[:attributes][:description]
    @sowing_method = data[:attributes][:sowing_method]
    @spread = data[:attributes][:spread]
    @row_spacing = data[:attributes][:row_spacing]
    @height = data[:attributes][:height]
    @main_image_path = data[:attributes][:main_image_path]
  end
end
