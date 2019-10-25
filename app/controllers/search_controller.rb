class SearchController < ApplicationController
  def index
    render locals: {
      facade: SearchFacade.new(params[:location]).get_station
    }
  end
end
