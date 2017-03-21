class CargoTrain < Train

  private

  def car_type_valid?(car)
    car.class = CargoCar
  end
end
