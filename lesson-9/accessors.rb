module Accessor

  def my_attr_accessor(*attrs)
    define_method("history") do |attr, value|
      @history ||= {}
      @history[attr] ||= []
      @history[attr] << value
    end

    attrs.each do |attr|
      var_attr = "@#{attr}"

      define_method(attr) { instance_variable_get(var_attr) }

      define_method("#{attr}=") do |value|
        instance_variable_set(var_attr, value)
        history(attr, value)
      end

      define_method("#{attr}_history") { @history[attr] }
    end
  end
end

class Child

  extend Accessor

  my_attr_accessor :name, :year

end