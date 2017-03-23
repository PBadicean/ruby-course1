module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      if @instances.nil?
        @instances = 0
      else
        @instances
      end
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.instances += 1
    end
  end
end
