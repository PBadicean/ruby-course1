require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'cargo_car'
require_relative 'passenger_car'

station_moskva = Station.new("Moskva")
station_milan = Station.new("Milan")
station_berlin = Station.new("Berlin")
station_amsterdam = Station.new("Amsterdam")
train1 = Cargo.new("L-185")
train2 = Passenger.new("K-100")
train3 = Passenger.new("C-32")

station_moskva.add_train(train1)
station_moskva.add_train(train2)
station_milan.add_train(train3)

route1 = Route.new(station_moskva, station_milan)
route1.add_station(station_berlin)
route1.add_station(station_amsterdam)

car8 = PassengerCar.new("red")
car7 = CargoCar.new("green")

train3.add_car(car8)
train1.add_car(car7)
puts train1.cars.inspect
puts train3.cars.inspect
