require_relative 'validation'
require_relative 'accessors'

class Station
  include Validation

  attr_reader :trains, :name

  validate :name, :format, /[a-zA-z]+/

  def initialize(name)
    @name = name
    @trains = []
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
