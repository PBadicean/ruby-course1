class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    filter_trains = []
    @trains.each do |train|
      filter_trains << train if train.type == type
    end
    filter_trains
  end
end

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

class Train
  attr_reader :type, :cars, :number
  attr_accessor :speed, :route

  def initialize(number, type, cars)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @index = -1
  end

  def stop
    @speed = 0
  end

  def add_car
    @cars += 1 if @speed == 0
  end

  def remove_car
    @cars -= 1 if @speed == 0 && @cars >= 1
  end

  def forward
    @index += 1 if @route.stations.count >= @index
  end

  def backward
    @index -= 1 if @index > 0
  end

  def prev_station
    @route.stations[@index - 1] if @route.stations.count[@index] > 1
  end

  def current_station
    @route.stations[@index]
  end

  def next_station
    @route.stations[@index + 1] if @route.stations.count > @index + 1
  end
end

station_moskva = Station.new("Moskva")
station_milan = Station.new("Milan")
station_berlin = Station.new("Berlin")
station_amsterdam = Station.new("Amsterdam")
train1 = Train.new("L-185", "passenger", 5)
train2 = Train.new("K-100", "large", 6)
train3 = Train.new("C-32", "passenger", 7)

station_moskva.add_train(train1)
station_moskva.add_train(train2)
station_milan.add_train(train3)

route1 = Route.new(station_moskva, station_milan)

route1.add_station(station_berlin)
route1.add_station(station_amsterdam)

train3.add_car
train3.route = route1
train3.forward
