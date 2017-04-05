require_relative 'station'
require_relative 'validation'

class Route
  include Validation

  attr_reader :stations, :station_start, :station_end

  validate :station_start, :type, Station
  validate :station_end, :type, Station

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
st1 = Station.new('moskow')
st2 = Station.new('berlin')
r = Route.new(st1, st2)
puts r.valid?
