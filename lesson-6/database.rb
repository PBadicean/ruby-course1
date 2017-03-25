class Database
  attr_reader :stations, :trains, :routes
  attr_accessor :route


  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def save_station(name)
    station = Station.new(name)
    @stations << station if station.valid?
  end

  def save_train(type, number)
    train = CargoTrain.new(number) if type == "cargo"
    train = PassengerTrain.new(number) if type == "passenger"
    if train.valid?
      @trains << train
      return true
    else
      return false
    end
  end

  def add_train_car(train)
    car = PassengerCar.new if train.class == PassengerTrain
    car = CargoCar.new if train.class == CargoTrain
    train.cars << car unless train.cars.include?(car)
  end

  def remove_train_car(train, car)
    train.cars.delete(car)
  end

  def save_route(station_start, station_end)
    route = Route.new(station_start, station_end)
    @routes << route
  end

  def edit_route(answer, station, route)
    if answer == 1
      route.add_station(station)
    elsif answer == 2
      route.stations.delete(station)
    end
  end

  def assign_route_to_train (route, train)
    train.route = route
    train.current_station.add_train(train)
  end

  def train_forward(train)
    train.forward
    train.current_station.add_train(train)
    train.prev_station.remove_train(train)
  end

  def train_backward(train)
    train.backward
    train.current_station.add_train(train)
    train.next_station.remove_train(train)
  end

end

