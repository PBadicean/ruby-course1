class Train
  include InstanceCounter
  include HasManufacture

  attr_reader :type, :cars, :number
  attr_accessor :speed, :route

  def initialize(number)
    @number = number
    @speed = 0
    @index = 0
    @cars = []
    self.class.all << self
    self.register_instance
  end

  class << self

    attr_accessor :all

    def all
      @all ||= []
    end

    def find(number)
      @train = nil
      @all.each do |train|
        @train = train if train.number == number
      end
      @train
    end
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
