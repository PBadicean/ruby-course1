class Train
  attr_reader :type, :cars, :number
  attr_accessor :speed, :route

  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @index = -1
    @cars = []
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
    @route.stations[@index - 1] if @route.stations.count[@index] > 1
  end

  def current_station
    @route.stations[@index]
  end

  def next_station
    @route.stations[@index + 1] if @route.stations.count > @index + 1
  end
end
