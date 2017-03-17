class Passenger < Train
  def add_car(car)
    @cars << car if car.class == PassengerCar && @speed == 0
  end

  def remove_car(car)
    @cars.delete(car) if car.class == PassengerCar && @speed == 0 &&  @cars.count >= 1
  end
end
