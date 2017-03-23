class Car
  include InstanceCounter
  include HasManufacture
  def initialize
    register_instance
  end
end
