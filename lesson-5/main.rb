require_relative 'has_manufacture'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'station'


train1 = PassengerTrain.new('ln-21')
train2 = PassengerTrain.new('dk-54')

puts PassengerTrain.instances

station = Station.new('moskow')
station1 = Station.new('london')

car = CargoCar.new
puts CargoCar.instances
