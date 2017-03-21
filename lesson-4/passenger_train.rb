class PassengerTrain < Train
  def car_type_valid?(car)
    car.class = PassengerCar && @speed = 0
  end
end
