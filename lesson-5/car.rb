class Car
  include InstanceCounter
  include HasManufacture
  def initialize
    self.register_instance
  end
end
