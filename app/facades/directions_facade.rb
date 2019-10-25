class DirectionsFacade
  #attr_reader :location
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_directions
    get_directions_to_fuel_station(@origin, @destination)[:routes].first[:legs].map do |directions_hash|
      Directions.new(directions_hash)
    end
  end

  def get_directions_to_fuel_station(origin, destination)
    GoogleService.new(origin, destination).directions
  end

end
