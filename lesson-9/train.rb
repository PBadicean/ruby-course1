require_relative 'validation'

class Train
  include Validation

  attr_reader :type, :cars, :number
  attr_accessor :speed, :route

  validate :number, :format, /^[a-z0-9]{3}-?[a-z0-9]{2}$/

  def initialize(number)
    @number = number
    @speed = 0
    @index = 0
    @cars = []
  end

  def add_car(car)
    @cars << car if car_type_valid?(car) && @speed == 0
  end

  def remove_car(car)
    @cars.delete(car) if car_type_valid?(car) && @speed == 0 && @cars.count >= 1
  end

  def stop
    @speed = 0
  end

  def forward
    @index += 1 if @route.stations.count >= @index
  end

  def backward
    @index -= 1 if @index > 0
  end

  def prev_station
    @route.stations[@index - 1]
  end

  def current_station
    @route.stations[@index]
  end

  def next_station
    @route.stations[@index + 1] if @route.stations.count > @index + 1
  end
end
tr = Train.new("sokol")
puts tr.valid?
