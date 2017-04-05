require_relative 'accessors'

class Person
  extend Accessors

  attr_accessor_with_history :name, :age
  strong_attr_accessor :name, String
end
wumen = Person.new
wumen.name = 'polina'
wumen.age = '17'
wumen.age = '16'
puts wumen.name
puts wumen.age_history.inspect
