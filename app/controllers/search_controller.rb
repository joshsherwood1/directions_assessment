class SearchController < ApplicationController
  def index
    render locals: {
      facade: SearchFacade.new(params[:location]).get_station,
      directions_facade: DirectionsFacade.new(params[:location], SearchFacade.new(params[:location]).get_station.first.address).get_directions
    }
  end
end
