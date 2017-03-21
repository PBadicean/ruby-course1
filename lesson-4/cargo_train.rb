class CargoTrain < Train
  def add_car(car)
    @cars << car if car.class == CargoCar && @speed == 0
    puts car.class
  end

  def remove_car(car)
    @cars.delete(car) if car.class == CargoCar && @speed == 0 &&  @cars.count >= 1
  end
end
