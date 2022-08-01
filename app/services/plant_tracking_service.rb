class PlantTrackingService
  def self.create_plant(attributes)
    response = BaseService.connection.post(
      "/api/v1/users/#{attributes[:user_id]}/gardens/#{attributes[:garden_id]}/plants",
      _json: attributes.to_json,
      content_type: 'application/json'
    )
    BaseService.get_json(response)
  end

  def self.get_plants(user_id, garden_id)
    response = BaseService.connection.get("/api/v1/users/#{user_id}/gardens/#{garden_id}/plants")
    BaseService.get_json(response)
  end

  def self.destroy_plant(user_id, garden_id, plant_id)
    response = BaseService.connection.delete("/api/v1/users/#{user_id}/gardens/#{garden_id}/plants/#{plant_id}")
  end

  def self.edit_plant(user_id, garden_id, plant_id, attributes)
    response = BaseService.connection.patch(
      "/api/v1/users/#{user_id}/gardens/#{garden_id}/plants/#{plant_id}",
      _json: attributes.to_json,
      content_type: 'application/json'
    )
    BaseService.get_json(response)
  end

end
