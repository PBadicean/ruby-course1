class Route
  attr_reader :stations

  def initialize(station_start, station_end)
    @stations = [station_start, station_end]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) if station != @stations.first &&  station != @stations.last
  end

  def valid?
    validate!
  rescue => e
    puts e
    false
  end

  private

  def validate!
    raise "Station start not is Station class" if stations.first.class != Station
    raise "Station end not is Station class" if stations.last.class != Station
    true
  end
end
