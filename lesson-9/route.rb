require_relative 'validation'
require_relative 'accessors'
class Route
  include Validation

  attr_reader :stations, :station_start, :station_end

  validate :station_start, :class, Station
  validate :station_end, :class, Station

  def initialize(station_start, station_end)
    @station_start = station_start
    @station_end = station_end

    @stations = [station_start, station_end]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) if station != @stations.first && station != @stations.last
  end
end
