require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'database'

class UserInput

  COMMANDS_METHOD = %w(
    create_station create_train add_car remove_car create_route
    edit_route set_route forward backward list_stations trains_station
  )
  COMMANDS_TEXT = [
    'create_station', 'create_train','add_car', 'remove_car', 'create_route',
    'edit_route', 'set_route', 'forward', 'backward', 'list_stations',
    'list trains_station', 'stop'
  ]

  def initialize
    @database = Database.new
  end

  def start
    puts 'Choose number available commands'
    puts ' '*80
    UserInput::COMMANDS_TEXT.each_with_index do |command, number|
      puts "#{number+1} #{command}"
    end
    input = gets.chomp.to_i
    index = input - 1
    command = UserInput::COMMANDS_METHOD[index]
    puts ' '*80
    send(command)
    puts '>'*80
    start
  end

  def list_stations
    puts @database.stations.inspect
    start
  end

  def create_station
    puts 'Write name station'
    name = gets.chomp
    @database.save_station(name)
    puts ' '*80
    puts @database.stations.last.inspect
  end

  def create_train
    puts 'Choose type 1:cargo or 2:passenger'
    type_nomer = gets.chomp.to_i
    type = 'cargo' if type_nomer == 1
    type = 'passenger' if type_nomer == 2
    if type.nil?
      puts 'You not choosed type'
      return start
    end
    puts ' '*80
    puts 'Write train number'
    number = gets.chomp
    @database.save_train(type, number)
    puts ' '*80
    puts @database.trains.last.inspect
  end

  def add_car
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    @database.add_train_car(train)
    puts ' '*80
    puts @database.trains[index_train].inspect
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
  end

  def create_route
    puts 'You must to choose start station and end station'
    puts @database.stations.inspect
    puts ' '*80
    puts 'write index start station'
    index_start = gets.chomp.to_i
    station_start = @database.stations[index_start]
    puts 'write index end station'
    index_end = gets.chomp.to_i
    station_end = @database.stations[index_end]
    @database.save_route(station_end, station_end)
    puts ' '*80
    puts @database.routes.last.inspect
  end

  def edit_route
    puts 'Choose index station'
    puts ' '*80
    puts @database.stations.inspect
    index_station = gets.chomp.to_i
    station = @database.stations[index_station]
    puts 'Choose index route'
    puts @database.routes.inspect
    index_route = gets.chomp.to_i
    route = @database.routes[index_route]
    puts 'you want 1:add or 2:remove'
    answer = gets.chomp.to_i
    @database.edit_route(answer, station, route)
    puts @database.routes.last.inspect
  end

  def set_route
    puts 'Choose index route'
    puts @database.routes.inspect
    index_route = gets.chomp.to_i
    route = @database.routes[index_route]
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    @database.assign_route_to_train(route, train)
    puts @database.trains.last.inspect
  end

  def forward
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    puts train.current_station.inspect
    puts ' '*80
    @database.train_forward(train)
    puts train.current_station.inspect
  end

  def backward
    puts 'Choose index train'
    puts @database.trains.inspect
    index_train = gets.chomp.to_i
    train = @database.trains[index_train]
    puts train.current_station.inspect
    puts ' '*80
    @database.train_backward(train)
    puts train.current_station.inspect
  end

  def trains_station
    puts 'Choose index station'
    puts ' '*80
    puts @database.stations.inspect
    index_station = gets.chomp.to_i
    station = @database.stations[index_station]
    puts station.trains.inspect
  end

  private

  def puts(s)
    super(s)
    STDOUT.flush
  end

end

program = UserInput.new()
program.start

