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
    @stations << station
  end

  def last_added_station
    @stations[-1]
  end

  def save_train(type, number)
    train = CargoTrain.new(number) if type == "cargo"
    train = PassengerTrain.new(number) if type == "passenger"
    @trains << train
  end

  def add_train_car(train)
    car = PassengerCar.new if train.class == PassengerTrain
    car = CargoCar.new if train.class == CargoTrain
    train.cars << car unless train.cars.include?(car)
  end

  def remove_train_car(train, car)
    train.cars.delete(car)
  end

  def last_added_train
    @trains[-1]
  end

  def save_route(index_start, index_end)
    start_station = @stations[index_start]
    end_station = @stations[index_end]
    route = Route.new(start_station, end_station)
    @routes << route
  end

  def change_route(answer, index_station, index_route)
    station = @stations[index_station]
    route = @routes[index_route]
    if answer == 1
      route.add_station(station)
    elsif answer == 2
      route.stations.delete(station)
    end
  end

  def last_added_route
    @routes[-1]
  end

  def save_set_route(index_route, index_train)
    route = @routes[index_route]
    train = @trains[index_train]
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
