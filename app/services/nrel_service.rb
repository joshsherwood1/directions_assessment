class NrelService
  def initialize(location)
    @location = location
  end

  # def get_member_data
  #   all_params = default_params.merge(house_hash)
  #   response = Faraday.get("https://www.potterapi.com/v1/characters", all_params)
  #   parse_json(response)
  # end

  # def get_member_data(house_hash)
  #   all_params = default_params.merge(house_hash)
  #   response = Faraday.get("https://www.potterapi.com/v1/characters", all_params)
  #   parse_json(response)
  # end

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
