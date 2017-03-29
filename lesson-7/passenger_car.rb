class PassengerCar < Car

  attr_reader :free_places, :takes_places

  def initialize(places)
    @free_places = places
    @takes_places = 0
  end

  def take_place
    @free_places -= 1
    @takes_places +=1
  end
end
