class Station
  attr_reader :trains, :name

  NAME_FORMAT = /[a-zA-z]+/

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

  def valid?
    validate!
  rescue => e
    puts e
    false
  end

  private

  def validate!
    raise "Name can't be nil" if @name.to_s.empty?
    raise "Nanme has invalid format" if @name !~ NAME_FORMAT
    true
  end
end
