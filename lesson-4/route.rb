class Route
  attr_reader :stations

  def initialize(station_start, station_end)
    @stations = [station_start, station_end]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) if station != @stations[0] &&  station != @stations[-1]
  end
end
