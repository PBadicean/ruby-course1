require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'database'

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

