class IpService
  def self.get_ip_location(ip)
    # binding.pry
    response = BaseService.ip_connection
    .get("/json.gp?ip=#{ip}", content_type: 'application/json')
    BaseService.get_json(response)
  end
end