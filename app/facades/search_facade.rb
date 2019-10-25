class SearchFacade
  #attr_reader :location
  def initialize(location)
    @location = location
  end

  def get_station
    get_fuel_station_location(@location)[:fuel_stations].map do |station_hash|
      Station.new(station_hash)
    end
  end

  def get_fuel_station_location(location)
    NrelService.new(location).station
  end

end
