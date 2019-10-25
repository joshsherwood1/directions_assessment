class NrelService
  def initialize(location)
    @location = location
  end

  def station
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json") do |req|
      req.params["api_key"] = ENV['NREL_API_KEY']
      req.params["location"] = @location
      req.params["limit"] = 1
      req.params["fuel_type"] = "ELEC"
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
