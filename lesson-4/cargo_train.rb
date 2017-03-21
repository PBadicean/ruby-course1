class CargoTrain < Train
  def car_type_valid?(car)
    car.class = CargoCar && @speed == 0  && @cars.count >= 1
  end
end
