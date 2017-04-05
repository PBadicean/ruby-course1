class CargoTrain < Train

  private

  def car_type_valid?(car)
    car.is_a? CargoCar
  end
end
