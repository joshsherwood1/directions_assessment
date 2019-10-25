class Directions
attr_reader :distance, :travel_time, :html_directions

  def initialize(attributes = {})
    @distance = attributes[:distance][:text]
    @travel_time = attributes[:duration][:text]
    @html_directions = attributes[:steps].map {|hashes| p hashes[:html_instructions]}
  end
end
