require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'


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

class UserInput
  def initialize
    @database = Database.new
  end

  def start
    puts 'Choose number available comands'
    puts ' '*80
    puts [
       '1 create_station', '2 create_train','3 add_car', '4 remove_car',
       '5 create_route', '6 change_route', '7 set_route', '8 forward',
       '9 backward', '10 list stations', '11 list trains station', '12 stop'
     ]
    comand = gets.chomp.to_i
    if comand == 1
      create_station
    elsif comand == 2
      create_train
    elsif comand == 3
      add_car
    elsif comand == 4
      remove_car
    elsif comand == 5
      create_route
    elsif comand == 6
      change_route
    elsif comand == 7
      set_route
    elsif comand == 8
      forward
    elsif comand == 9
      backward
    elsif comand == 10
      puts @database.stations.inspect
      start
    elsif comand == 11
      trains_station
    elsif comand == 12
      return
    end
  end

  def create_station
    puts ' '*80
    puts 'Write name station'
    name = gets.chomp
    @database.save_station(name)
    puts ' '*80
    puts @database.last_added_station.inspect
    puts '>'*80
    start
  end

  def create_train
    puts ' '*80
    puts 'Choose type 1:cargo or 2:passenger'
    type_nomer = gets.chomp.to_i
    if type_nomer == 1
      type = 'cargo'
    elsif type_nomer == 2
      type = 'passenger'
    else
      puts 'You not choosed type'
      start
      return
    end
    puts ' '*80
    puts 'Write train number'
    number = gets.chomp
    @database.save_train(type, number)
    puts ' '*80
    puts @database.last_added_train.inspect
    puts '>'*80
    start
  end

  def add_car
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    @database.add_train_car(train)
    puts ' '*80
    puts @database.trains[index_train].inspect
    puts '>'*80
    start
  end

  def remove_car
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    puts 'Choose index car'
    puts train.cars.inspect
    index_car = gets.chomp.to_i
    car = train.cars[index_car]
    @database.remove_train_car(train, car)
    puts '>'*80
    puts @database.trains[index_train].inspect
    start
  end

  def create_route
    puts ' '*80
    puts 'You must to choose start station and end station'
    puts @database.stations.inspect
    puts ' '*80
    puts 'write index start station'
    index_start = gets.chomp.to_i
    puts 'write index end station'
    index_end = gets.chomp.to_i
    @database.save_route(index_start, index_end)
    puts ' '*80
    puts @database.last_added_route.inspect
    puts '>'*80
    start
  end

  def change_route
    puts ' '*80
    puts 'Choose index station'
    puts ' '*80
    puts @database.stations.inspect
    index_station = gets.chomp.to_i
    puts 'Choose index route'
    puts @database.routes.inspect
    index_route = gets.chomp.to_i
    puts 'you want 1:add or 2:remove'
    answer = gets.chomp.to_i
    @database.change_route(answer, index_station, index_route)
    puts @database.last_added_route.inspect
    puts '>'*80
    start
  end

  def set_route
    puts ' '*80
    puts 'Choose index route'
    puts @database.routes.inspect
    index_route = gets.chomp.to_i
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    @database.save_set_route(index_route, index_train)
    puts @database.last_added_train.inspect
    puts '>'*80
    start
  end

  def forward
    puts ' '*80
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    puts train.current_station.inspect
    puts ' '*80
    @database.train_forward(train)
    puts train.current_station.inspect
    puts '>'*80
    start
  end

  def backward
    puts ' '*80
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    puts train.current_station.inspect
    puts ' '*80
    @database.train_backward(train)
    puts train.current_station.inspect
    puts '>'*80
    start
  end

  def trains_station
    puts ' '*80
    puts 'Choose index station'
    puts ' '*80
    puts @database.stations.inspect
    index_station = gets.chomp.to_i
    station = @database.stations[index_station]
    puts station.trains.inspect
    puts '>'*80
    start
  end

  private

  def puts(s)
    super(s)
    STDOUT.flush
  end

end

program = UserInput.new()
program.start

