module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name_attr, type, type_value = nil)
      @validations ||= []
      @validations << { name_attr => [type, type_value] }
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get(:@validations).each do |valid|
        attr = valid.keys.first
        rule = valid[attr]
        attr_val = instance_variable_get("@#{attr}")
        if rule.include?(:presence)
          raise "#{attr} can't be nil" if attr_val.to_s.empty?
        elsif rule.include?(:format)
          raise "#{attr} has invalid format" if attr_val.to_s !~ rule[1]
        elsif rule.include?(:class)
          raise "Your #{attr} has wrong class" if attr_val.class != rule[1]
        end
      end
    end

    def valid?
      validate!
      true
    rescue => e
      puts e
      false
    end
  end
end
