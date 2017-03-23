class Station
  include InstanceCounter
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    self.register_instance
  end

  class << self
    attr_accessor :all

    def all
      if @all.nil?
        @all = []
      else
        @all
      end
    end
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    filter_trains = []
    @trains.each do |train|
      filter_trains << train if train.type == type
    end
    filter_trains
  end
end
