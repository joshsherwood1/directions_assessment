class SearchFacade
  #attr_reader :location
  def initialize(location)
    @location = location
  end

  def members
    get_fuel_station_location(@location).map do |station_hash|
      Station.new(station_hash)
    end
  end

  def get_fuel_station_location(@location)
    NrelService.new(@location).get_location
  end

end
