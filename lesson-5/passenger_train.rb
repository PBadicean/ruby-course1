class PassengerTrain < Train
  private

  def car_type_valid?(car)
    car.is_a? == PassengerCar
  end
end
