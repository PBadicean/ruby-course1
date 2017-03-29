class Train
  attr_reader :type, :cars, :number
  attr_accessor :speed, :route

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/

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

  def puts_cars
    @cars.each do |car|
      yield(car)
    end
  end

  def valid?
    validate!
  rescue => e
    puts e
    false
  end

  private

  def validate!
    raise "Number can't be nil" if @number.nil?
    raise "Number has invalid format" if @number !~ NUMBER_FORMAT
    true
  end
end
