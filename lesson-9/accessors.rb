module Accessor
  def attr_accessor_with_history(*attrs)
    define_method('history') do |attr, value|
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

  def strong_attr_accessor(attr, klass)
    var_attr = "@#{attr}"
    define_method(attr) { instance_variable_get(var_attr) }

    define_method("#{attr}=") do |value|
      if value.class != klass
        raise 'Error!!!'
      else
        instance_variable_set(var_attr, value)
        history(attr, value)
      end
    end
  end
end
