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

  def get_member_data
    response = Faraday.get("https://www.potterapi.com/v1/characters") do |req|
      req.params["key"] = ENV['POTTER_API_KEY']
      req.params["house"] = @house
      req.params["orderOfThePhoenix"] = true
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def default_params
    {
      key: ENV['POTTER_API_KEY'],
      orderOfThePhoenix: true
    }
  end
