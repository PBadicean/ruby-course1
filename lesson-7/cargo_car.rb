class CargoCar < Car
  attr_reader :total_volume, :takes_volume

  def initialize(volume)
    @total_volume = volume
    @takes_volume = 0
  end

  def take_volume(volume)
    @total_volume -= volume
    @takes_volume += volume
  end
end
