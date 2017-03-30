class PassengerTrain < Train

  private

  def car_type_valid?(car)
    car.class == PassengerCar
  end
end
